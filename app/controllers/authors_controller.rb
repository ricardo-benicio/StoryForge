class AuthorsController < ApplicationController
  def index
    @authors = Author.all.order(created_at: :asc)
  end

  def show
  end
end