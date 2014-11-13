# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'CSV'

CSV.foreach("..db/politicians.csv", headers:true) do |row|
	regexp = /([0-9]{0,2})\/([0-9]{0,2})\/([0-9]{4})/
	d = regexp.match(row['birthdate'])
	Politician.create(title: row['title'], firstname: row['firstname'], lastname: row['lastname'],
	party: row['party'], state: row['state'], district: row['district'], gender: row['gender'],
	phone: row['phone'], website: row['website'], webform: row['webform'], drive_id: row['drive_id'],
	bioguide_id: row['bioguide_id'], votesmart_id: row['votesmart_id'], fec_id: row['fec_id'],
	govtrack_id: row['govtrack_id'], crp_id: row['crp_id'], twitter_id: row['twitter_id'],
	youtube_url: row['youtube_url'], birthdate: Date.new(d[3].to_i, d[1].to_i, d[2].to_i), oc_email: row['oc_email'],
	congresspedia_url: row['congresspedia_url'])
end

# csv file has no headers format is
# zip, state, district
CSV.foreach("..db/zips.csv") do |i|
	zip_code = Zipcode.new(zip: i[0])
	pol = Politician.where('state = ? AND district = ?', i[1], i[2]).first
	if !pol.nil?
		pol.zipcodes << zip_code
		pol.save
	end
end

CSV.foreach("..db/entity_ids.csv") do |row|
	p = Politician.find(row[0])
	p.entity_id = row[1]
	p.full_name = "#{p.firstname} #{p.lastname}"
	p.save
end
