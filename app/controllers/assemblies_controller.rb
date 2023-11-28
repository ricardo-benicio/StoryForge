class AssembliesController < ApplicationController
  before_action :set_assembly, only: %i[show edit update destroy]
  before_action :set_part_id_options, only: %i[new show edit update destroy]
  before_action :set_book_id_options, only: %i[new show edit update destroy]

  def index
    @assemblies = Assembly.all
  end

  def show; end

  def new
    @assembly = Assembly.new
  end

  def edit; end

  def create
    @assembly = Assembly.new(assembly_params)
    if @assembly.save
      redirect_to assembly_url(@assembly), notice: 'Assembly was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @assembly.update(assembly_params)
      redirect_to assembly_url(@assembly), notice: 'Assembly was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @assembly.destroy
    redirect_to assemblies_url, notice: 'Assembly was successfully destroyed.'
  end

  private

  def set_book_id_options
    @book_id_options = Book.all.pluck(:published_at, :id)
  end

  def set_part_id_options
    @part_id_options = Part.all.pluck(:part_number, :id)
  end

  def set_assembly
    @assembly = Assembly.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def assembly_params
    params.require(:assembly).permit(:name, :part_id, :book_id)
  end
end
