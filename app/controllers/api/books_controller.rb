# frozen_string_literal: true

module Api
  class BooksController < Api::ApiController
    before_action :set_book, only: %i[show update destroy]
    def index
      @book = Book.includes(:author).all

      render json: @book, status: :ok
    end

    def show; end

    def create
      @book = Book.new(book_params)

      return render :create, status: :created if @book.save

      render json: { errors: @book.errors.full_messages }, status: :unprocessable_entity
    end

    def update
      return render :update, status: :ok if @book.update(book_params)

      render json: { errors: @book.errors.full_messages }, status: :unprocessable_entity
    end

    def destroy
      return head :no_content if @book.destroy

      render json: { message: 'Failed to delete the author.' }, status: :unprocessable_entity
    end

    private

    def set_book
      @book = Book.find_by(id: params[:id])
    end

    def book_params
      params.require(:book).permit(:isbn, :published_at, :author_id)
    end
  end
end
