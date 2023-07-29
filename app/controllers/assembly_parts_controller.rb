class AssemblyPartsController < ApplicationController
  before_action :set_assembly_part, only: %i[ show edit update destroy ]

  # GET /assembly_parts or /assembly_parts.json
  def index
    @assembly_parts = AssemblyPart.all
  end

  # GET /assembly_parts/1 or /assembly_parts/1.json
  def show
  end

  # GET /assembly_parts/new
  def new
    @assembly_part = AssemblyPart.new
  end

  # GET /assembly_parts/1/edit
  def edit
  end

  # POST /assembly_parts or /assembly_parts.json
  def create
    @assembly_part = AssemblyPart.new(assembly_part_params)

    respond_to do |format|
      if @assembly_part.save
        format.html { redirect_to assembly_part_url(@assembly_part), notice: "Assembly part was successfully created." }
        format.json { render :show, status: :created, location: @assembly_part }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @assembly_part.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /assembly_parts/1 or /assembly_parts/1.json
  def update
    respond_to do |format|
      if @assembly_part.update(assembly_part_params)
        format.html { redirect_to assembly_part_url(@assembly_part), notice: "Assembly part was successfully updated." }
        format.json { render :show, status: :ok, location: @assembly_part }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @assembly_part.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /assembly_parts/1 or /assembly_parts/1.json
  def destroy
    @assembly_part.destroy

    respond_to do |format|
      format.html { redirect_to assembly_parts_url, notice: "Assembly part was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_assembly_part
      @assembly_part = AssemblyPart.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def assembly_part_params
      params.require(:assembly_part).permit(:assembly_id, :part_id)
    end
end
