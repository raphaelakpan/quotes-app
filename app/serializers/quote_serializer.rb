class QuoteSerializer < ActiveModel::Serializer
  attributes :content, :author
  has_one :author
end
