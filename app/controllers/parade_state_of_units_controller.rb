class ParadeStateOfUnitsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_parade_state_of_unit, only: %i[ edit update destroy ]

  # GET /parade_state_of_units or /parade_state_of_units.json
  def index
    @parade_state_of_units = ParadeStateOfUnit.all
  end

  # GET /parade_state_of_units/new
  def new
    @parade_state_of_unit = ParadeStateOfUnit.new
  end

  # GET /parade_state_of_units/1/edit
  def edit
  end

  # PATCH/PUT /parade_state_of_units/1 or /parade_state_of_units/1.json
  def update
    respond_to do |format|
      if @parade_state_of_unit.update(parade_state_of_unit_params)
        format.html { redirect_to parade_state_of_units_path, notice: "Parade state of unit was successfully updated." }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /parade_state_of_units/1 or /parade_state_of_units/1.json
  def destroy
    @parade_state_of_unit.destroy

    respond_to do |format|
      format.html { redirect_to parade_state_of_units_path, notice: "Parade state of unit was successfully destroyed." }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_parade_state_of_unit
      @parade_state_of_unit = ParadeStateOfUnit.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def parade_state_of_unit_params
      params.fetch(:parade_state_of_unit, {}).permit(:auth, :posted, :present)
    end
end
