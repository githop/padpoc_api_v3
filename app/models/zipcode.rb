class Zipcode < ActiveRecord::Base
  belongs_to :politician
  scope :zip, -> (zip) { where('zip = ?', "#{zip}") }


  def full_name
    politician.full_name
  end

  def title
  	politician.title
  end

  def party
  	politician.party
  end

  def party=(p)
    politician.party = p
  end

  def state
  	politician.state
  end

  def drive_id
  	politician.drive_id
  end
end
