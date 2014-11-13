class PoliticianSerializer < ActiveModel::Serializer
  attributes :id, :full_name, :title, :party, :state, :drive_id

  has_one :contribution
end
