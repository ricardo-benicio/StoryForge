class Api::AuthorsController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :set_author, only: %i[show update destroy]
  def index
    authors = Author.all
    render json: authors, except: %i[created_at updated_at]
  end

  def show; end

  def create
    @author = Author.new(author_params)
    if @author.save
      render json: @author, status: :created, except: %i[created_at updated_at]
    else
      render json: { errors: @author.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    if @author.update(author_params)
      render json: @author, except: %i[ created_at updated_at ]
    else
      render json: { errors: @author.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    @author.destroy
    head :no_content
  end

  private

  def set_author
    @author = Author.find(params[:id])
  end

  def author_params
    params.require(:author).permit(:name, :cpf)
  end
end
