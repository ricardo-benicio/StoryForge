class PartsController < ApplicationController
  before_action :set_part, only: %i[show edit update destroy]
  before_action :set_supplier_id_options, only: %i[new show edit update destroy]

  def index
    @parts = Part.all
  end

  def show; end

  def new
    @part = Part.new
  end

  def edit; end

  def create
    @part = Part.new(part_params)
    if @part.save
      redirect_to part_url(@part), notice: 'Part was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @part.update(part_params)
      redirect_to part_url(@part), notice: 'Part was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @part.destroy
    redirect_to parts_url, notice: 'Part was successfully destroyed.'
  end

  private

  def set_supplier_id_options
    @supplier_id_options = Supplier.all.pluck(:name, :id)
  end

  def set_part
    @part = Part.find(params[:id])
  end

  def part_params
    params.require(:part).permit(:part_number, :supplier_id)
  end
end
