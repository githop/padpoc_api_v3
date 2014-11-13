class SlimPoliSerializer < ActiveModel::Serializer
  attributes :id, :full_name, :title, :party, :state, :drive_id

  def party
  	pty = object.party
  	if pty == 'D'
  		object.party = 'dem'
  	elsif pty == 'R'
  		object.party = 'rep'
  	else
  		object.party = 'ind'
  	end
  end
end
