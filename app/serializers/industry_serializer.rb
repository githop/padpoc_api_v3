class IndustrySerializer < ActiveModel::Serializer
  attributes :id, :name, :total
  has_one :contribution
end
