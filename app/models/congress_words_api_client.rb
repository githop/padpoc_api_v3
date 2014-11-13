require 'httparty'
require_relative 'sunlight_api_client'

class CongressWordsApiClient < SunlightApiClient
	include HTTParty
	base_uri 'http://capitolwords.org/api/1'

	def get_word_count(bioguide_id)
		options = {query: {apikey: @api_key, entity_type: "legislator", entity_value: bioguide_id} }
		self.class.get("/phrases.json", options)
	end

end