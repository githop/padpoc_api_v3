class ContributionSerializer < ActiveModel::Serializer
  attributes :id, :politician_id, :out_state, :in_state, :pac, :individual

  has_many :organizations
  has_many :industries
  has_many :word_counts
end
