class Politician < ActiveRecord::Base
	has_many :zipcodes
	has_one :contribution
	has_many :organizations, through: :contribution
	has_many :industries, through: :contribution
	has_many :word_counts, through: :contribution

	scope :q, -> (query) { where(["firstname LIKE :s OR lastname LIKE :s OR full_name LIKE :s", :s => "#{query.titleize}%"]) }
	scope :full_name, -> (name) { where("full_name LIKE ?", "#{name}%") }
	scope :state, -> (st) { where(:state => st) }


	SL_API = SunlightApiClient.new

	def fetch_all_contributions
		if self.contribution.nil?
			contrib = Contribution.new
			fetch_breakdown(contrib)
			fetch_org_vs_pac(contrib)
			fetch_org_contribs(contrib)
			fetch_industry_contribs(contrib)
			fetch_word_count(contrib)
			self.contribution = contrib
			self.save
			self
		end
	end

	def get_org_contributions(limit)
		SL_API.get_top_contributions(self.entity_id, limit)
	end

	def get_industry_contributions(limit)
		SL_API.get_top_industry(self.entity_id, limit)
	end

	def home_vs_out_of_state_contributions
		SL_API.get_local_breakdown(self.entity_id)
	end

	def indiv_vs_pac_contributions
		SL_API.get_indiv_vs_pac(self.entity_id)
	end

	def get_top_words
		CongressWordsApiClient.new().get_word_count(self.bioguide_id)
	end

	def fetch_word_count(contrib)
		top_words = self.get_top_words.parsed_response.sort_by{|k,v| k['count']}
		words = []
		words << top_words.pop(10)
		words << top_words.shift(10)
		words.each do |set|
			set.each do |word|
				contrib.word_counts << WordCount.new(tfidf: word['tfidf'], count: word['count'], word: word['ngram'])
			end
		end
		contrib.save
	end

	def fetch_org_vs_pac(contrib)
		pac_person = self.indiv_vs_pac_contributions
		contrib.pac = pac_person.parsed_response['Individuals'][1]
		contrib.individual = pac_person.parsed_response['PACs'][1]
		contrib.save
	end

	def fetch_breakdown(contrib)
		breakdowns = self.home_vs_out_of_state_contributions
		contrib.out_state = breakdowns.parsed_response["In-State"][1]
		contrib.in_state =  breakdowns.parsed_response["Out-of-State"][1]
		contrib.save
	end

	def fetch_org_contribs(contrib)
		org_contribs = self.get_org_contributions(12)
		org_contribs.each do |org|
			contrib.organizations << Organization.new(name: org['name'], total: org['total_amount'], employee_total: org['employee_amount'], direct_total: org['direct_amount'])
		end
		contrib.save
	end

	def fetch_industry_contribs(contrib)
		industry_contribs = self.get_industry_contributions(12)
		industry_contribs.each do |ind|
			contrib.industries << Industry.new(name: ind['name'], total: ind['amount'])
		end
		contrib.save
	end

end
