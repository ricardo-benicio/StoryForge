module Api
  class SuppliersController < ApplicationController
    skip_before_action :verify_authenticity_token
    before_action :set_supplier, only: %i[show update destroy]

    def index
      @suppliers = Supplier.all
      render json: @suppliers, except: %i[created_at updated_at]
    end

    def show
      render json: @supplier.as_json(include: { account: { only: %i[account_number digit] } },
                                     except: %i[created_at updated_at])
    end

    def create
      @supplier = Supplier.new(params_supplier)

      if @supplier.save
        render json: @supplier, status: :created, except: %i[created_at updated_at]
      else
        render json: @supplier.errors.full_messages, status: :unprocessable_entity
      end
    end

    def update
      if @supplier.update(params_supplier)
        render json: @supplier, except: %i[created_at updated_at]
      else
        render json: @supplier.errors, status: :unprocessable_entity
      end
    end

    def destroy
      @supplier.destroy
      head :no_content
    end

    private

    def set_supplier
      @supplier = Supplier.find(params[:id])
    end

    def params_supplier
      params.require(:supplier).permit(:name, :cnpj)
    end
  end
end
