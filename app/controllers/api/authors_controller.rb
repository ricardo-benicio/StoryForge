# frozen_string_literal: true

module Api
  class AuthorsController < ApplicationController
    before_action :set_author, only: %i[index create show update destroy]

    def index
      @authors = Author.all
      render json: authors, status: :ok
    end
  end
end
