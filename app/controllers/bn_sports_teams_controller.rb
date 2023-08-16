class BnSportsTeamsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_bn_sports_team, only: %i[ edit update destroy ]

  # GET /bn_sports_teams/new
  def new
    @bn_sports_team = BnSportsTeam.new
  end

  # GET /bn_sports_teams/1/edit
  def edit
  end

  # POST /bn_sports_teams or /bn_sports_teams.json
  def create
    @bn_sports_team = BnSportsTeam.new(bn_sports_team_params)

    respond_to do |format|
      if @bn_sports_team.save
        format.html { redirect_to bn_nominal_roll_url(@bn_sports_team.bn_nominal_roll), notice: "Bn sports team was successfully created." }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /bn_sports_teams/1 or /bn_sports_teams/1.json
  def update
    respond_to do |format|
      if @bn_sports_team.update(bn_sports_team_params)
        format.html { redirect_to bn_nominal_roll_url(@bn_sports_team.bn_nominal_roll), notice: "Bn sports team was successfully updated." }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bn_sports_teams/1 or /bn_sports_teams/1.json
  def destroy
    @bn_sports_team.destroy

    respond_to do |format|
      format.html { redirect_to bn_nominal_roll_url(@bn_sports_team.bn_nominal_roll), notice: "Bn sports team was successfully destroyed." }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bn_sports_team
      @bn_sports_team = BnSportsTeam.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def bn_sports_team_params
      parameters = params.require(:bn_sports_team).permit(:bn_nominal_rolls_id, :game_level, :game, :remarks)
      parameters["bn_nominal_roll_id"] = params["bn_nominal_roll_id"]
      parameters
    end
end
