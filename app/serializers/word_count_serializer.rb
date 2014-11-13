class WordCountSerializer < ActiveModel::Serializer
  attributes :id, :tfidf, :count, :word
  has_one :contribution
end
