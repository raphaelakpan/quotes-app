class QuotesController < ApplicationController
  def index
    @quotes = QuotesQuery.new(
      limit: params[:limit],
      offset: params[:offset],
      query: params[:query]
    ).quotes

    respond_to do |format|
      format.html
      format.json do
        render json: @quotes, each_serializer: QuoteSerializer
      end
    end
  end

  def create
    author = Author.find_or_build_author(quote_params[:author])

    unless author.valid?
      render json: { error: author.errors.full_messages }, status: 422
      return;
    end

    quote = Quote.new(author: author, content: quote_params[:content])

    if quote.save
      flash[:success] = "Quote created successfully"
      redirect_to root_path
    else
      render json: { error: quote.errors.full_messages }, status: 422
    end
  end

  private

  def quote_params
    params.require(:quote).permit(:content, :author)
  end
end
