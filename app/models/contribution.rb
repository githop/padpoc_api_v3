class Contribution < ActiveRecord::Base
  belongs_to :politician
  has_many :industries
  has_many :organizations
  has_many :word_counts
end
