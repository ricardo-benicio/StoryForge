# frozen_string_literal: true

module Api
  class AuthorsController < Api::ApiController
    before_action :set_author, only: %i[show update destroy]

    def index
      @author = Author.all
      render json: @author, status: :ok
    end

    def show; end

    def create
      @author = Author.new(author_params)

      render :create, status: :created if @author.save

      render json: { errors: @author.errors.full_messages }, status: :unprocessable_entity
    end

    def update
      return render :update, status: :ok if @author.update(author_params)

      render json: { errors: @author.errors.full_messages }, status: :unprocessable_entity
    end

    def destroy
      return head :no_content if @author.destroy

      render json: { message: 'Failed to delete the author.' }, status: :unprocessable_entity
    end

    private

    def set_author
      @author = Author.find_by(id: params[:id])
    end

    def author_params
      params.require(:author).permit(:name, :cpf)
    end
  end
end
