class QuoteSerializer < ActiveModel::Serializer
  attributes :content, :author

  def author
    {
      name: self.object.author.name
    }
  end
end
