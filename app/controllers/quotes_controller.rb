class QuotesController < ApplicationController
  def index
    @quotes = Quote.includes(:author)
  end
end
