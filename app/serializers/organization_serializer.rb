class OrganizationSerializer < ActiveModel::Serializer
  attributes :id, :name, :total, :employee_total, :direct_total
  has_one :contribution
end
