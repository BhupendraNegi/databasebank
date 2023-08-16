class LeaveStatesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_leave_state, only: %i[ edit update destroy ]


  # GET /leave_states/new
  def new
    @leave_state = LeaveState.new
  end

  # GET /leave_states/1/edit
  def edit
  end

  # POST /leave_states or /leave_states.json
  def create
    @leave_state = LeaveState.new(leave_state_params)

    respond_to do |format|
      if @leave_state.save
        format.html { redirect_to bn_nominal_roll_url(@leave_state.bn_nominal_roll), notice: "Leave state was successfully created." }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /leave_states/1 or /leave_states/1.json
  def update
    respond_to do |format|
      if @leave_state.update(leave_state_params)
        format.html { redirect_to bn_nominal_roll_url(@leave_state.bn_nominal_roll), notice: "Leave state was successfully updated." }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /leave_states/1 or /leave_states/1.json
  def destroy
    @leave_state.destroy

    respond_to do |format|
      format.html { redirect_to bn_nominal_roll_url(@leave_state.bn_nominal_roll), notice: "Leave state was successfully destroyed." }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_leave_state
      @leave_state = LeaveState.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def leave_state_params
      parameters = params.require(:leave_state).permit(:bn_nominal_rolls_id, :al, :cl, :furlough, :remarks)
      parameters["bn_nominal_roll_id"] = params["bn_nominal_roll_id"]
      parameters
    end
end
