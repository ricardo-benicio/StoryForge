module Api
  class AssembliesController < ApplicationController
    skip_before_action :verify_authenticity_token
    before_action :set_assembly, only: %i[show update destroy]
    def index
      @assemblies = Assembly.all
      render json: @assemblies, except: %i[created_at]
    end

    def show
      render json: @assembly
    end

    def create
      @assembly = Assembly.new(params_assembly)

      if @assembly.save
        render json: @assembly, status: :created, except: %i[created_at]
      else
        render json: @assembly.errors.full_messages, status: :unprocessable_entity
      end
    end

    def update
      if @assembly.update(params_assembly)
        render json: @assembly, except: %i[created_at]
      else
        render json: @assembly.errors.full_messages, status: :unprocessable_entity
      end
    end

    def destroy
      @assembly.destroy
      head :no_content
    end

    private

    def set_assembly
      @assembly = Assembly.find(params[:id])
    end

    def params_assembly
      params.require(:assembly).permit(:name, part_ids: [], book_ids: [])
    end
  end
end
