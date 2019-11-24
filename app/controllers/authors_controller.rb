class AuthorsController < ApplicationController
  def index
    authors = Author.where("name ~* :name", name: params[:query])
    render json: authors, status: :ok
  end
end
