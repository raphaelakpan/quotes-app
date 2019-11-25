class QuotesQuery
  attr_reader :limit, :offset, :query, :quotes

  def initialize(limit: nil, offset: nil, query: nil)
    @limit = limit || 10
    @offset = offset || 0
    @query = query&.strip

    fetch_quotes
  end

  private

  def fetch_quotes
    @quotes = search_scope
      .includes(:author)
      .order(created_at: :desc)
      .limit(limit)
      .offset(offset)
  end

  def search_scope
    return Quote unless query.present?

    quote_scope = Quote.joins(:author)
    quote_scope.where("content ~* :query", query: query).or(
      quote_scope.where("authors.name ~* :query", query: query)
    )
  end
end
