# frozen_string_literal: true

module Api
  class AccountsController < ApplicationController
    skip_before_action :verify_authenticity_token
    before_action :set_account

    def index
      @accounts = Account.includes(:supplier).all
      render json: @accounts
    end

    def show
      render json: @account
    end

    def create
      @account = Account.new(params_account)
      if @account.save
        render json: @account, status: :created
      else
        render json: @account.errors, status: :unprocessable_entity
      end
    end

    def update
      if @account.update(params_account)
        render json: @account, except: %i[created_at]
      else
        render json: @account.errors, status: :unprocessable_entity
      end
    end

    def destroy
      @account.destroy
      head :no_content
    end

    private

    def set_account
      @account = Account.find_by(id: params[:id])
    end

    def params_account
      params.require(:account).permit(:account_number, :digit, :supplier_id)
    end
  end
end
