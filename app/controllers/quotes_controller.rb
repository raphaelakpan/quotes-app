class QuotesController < ApplicationController
  def index
    @quotes = Quote.includes(:author).order(created_at: :desc)
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
      render json: { success: true }, status: :ok
    else
      render json: { error: quote.errors.full_messages }, status: 422
    end
  end

  private

  def quote_params
    params.require(:quote).permit(:content, :author)
  end
end
