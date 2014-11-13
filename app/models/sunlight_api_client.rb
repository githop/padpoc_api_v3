require 'httparty'

class SunlightApiClient

	include HTTParty
	base_uri 'http://transparencydata.com/api/1.0'

	def initialize
		@api_key = "a779381e33a541279d3f1dd45d366cd6"
	end

	def search_by_fullname(name)
		options = {query: {apikey: @api_key, search: "#{name}", type: "politician"}}
		self.class.get("/entities.json", options)
	end

	def get_entity_id(crp_id)
		options = {query: {apikey: @api_key, namespace: "urn:crp:recipient", id: "#{crp_id}"}}
		self.class.get("/entities/id_lookup.json", options)
	end

	def get_top_contributions(entity_id, limit)
		options = {query: {apikey: @api_key, limit: limit}}
		self.class.get("/aggregates/pol/#{entity_id}/contributors.json", options)
	end

	def get_top_industry(entity_id, limit)
		options = {query: {apikey: @api_key, limit: limit}}
		self.class.get("/aggregates/pol/#{entity_id}/contributors/industries.json", options)
	end

	def get_local_breakdown(entity_id)
		options = {query: {apikey: @api_key}}
		self.class.get("/aggregates/pol/#{entity_id}/contributors/local_breakdown.json", options)
	end

	def get_indiv_vs_pac(entity_id)
		options = {query: {apikey: @api_key}}
		self.class.get("/aggregates/pol/#{entity_id}/contributors/type_breakdown.json", options)
	end

end

# sl = SunlightApiClient.new

# puts response = sl.get_entity_id("N00003675").to_json
# puts response.request.last_uri.to_s
