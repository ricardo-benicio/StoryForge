module Api
  class PartsController < ApplicationController
    skip_before_action :verify_authenticity_token
    before_action :set_part
    def index
      @parts = Part.all
      render json: @parts
    end

    def show
      render json: @part
    end

    def create
      @part = Part.new(params_part)
      if @part.save
        render json: @part
      else
        render json: @part.errors, status: :unprocessable_entity
      end
    end

    def update
      if @part.update(params_part)
        render json: @part, except: %i[created_at]
      else
        render json: @part.errors, status: :unprocessable_entity
      end
    end

    def destroy
      @part.destroy
      head :no_content
    end

    private

    def set_part
      @part = Part.find_by(id: params[:id])
    end

    def params_part
      params.require(:part).permit(:name, :price, :part_number, :supplier_id)
    end
  end
end
