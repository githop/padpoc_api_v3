class WordCountSerializer < ActiveModel::Serializer
  attributes :id, :tfidf, :count, :word
end
