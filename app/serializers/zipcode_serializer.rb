class ZipcodeSerializer < ActiveModel::Serializer
  attributes :id, :zip
  has_one :politician
end
