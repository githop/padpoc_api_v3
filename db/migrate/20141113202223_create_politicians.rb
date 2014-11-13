class CreatePoliticians < ActiveRecord::Migration
  def change
    create_table :politicians do |t|
    	t.string :title
    	t.string :firstname, index: true
    	t.string :lastname, index: true
        t.string :full_name, index: true
    	t.string :party
    	t.string :state, index: true
    	t.string :district
    	t.string :gender
    	t.string :phone
    	t.string :website
    	t.string :webform
    	t.string :drive_id, index: true
        t.string :entity_id, index: true
    	t.string :bioguide_id
    	t.string :votesmart_id
    	t.string :fec_id
    	t.string :govtrack_id
    	t.string :crp_id
    	t.string :twitter_id
    	t.string :youtube_url
    	t.string :congresspedia_url
    	t.date   :birthdate
    	t.string :oc_email
      t.timestamps
    end
  end
end
