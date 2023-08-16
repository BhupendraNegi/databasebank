class AwardsAndAchievementsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_awards_and_achievement, only: %i[ edit update destroy ]

  # GET /awards_and_achievements/new
  def new
    @awards_and_achievement = AwardsAndAchievement.new
  end

  # GET /awards_and_achievements/1/edit
  def edit
  end

  # POST /awards_and_achievements or /awards_and_achievements.json
  def create
    @awards_and_achievement = AwardsAndAchievement.new(awards_and_achievement_params)

    respond_to do |format|
      if @awards_and_achievement.save
        format.html { redirect_to bn_nominal_roll_url(@awards_and_achievement.bn_nominal_roll), notice: "Awards and achievement was successfully created." }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /awards_and_achievements/1 or /awards_and_achievements/1.json
  def update
    respond_to do |format|
      if @awards_and_achievement.update(awards_and_achievement_params)
        format.html { redirect_to bn_nominal_roll_url(@awards_and_achievement.bn_nominal_roll), notice: "Awards and achievement was successfully updated." }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /awards_and_achievements/1 or /awards_and_achievements/1.json
  def destroy
    @awards_and_achievement.destroy

    respond_to do |format|
      format.html { redirect_to bn_nominal_roll_url(@awards_and_achievement.bn_nominal_roll), notice: "Awards and achievement was successfully destroyed." }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_awards_and_achievement
      @awards_and_achievement = AwardsAndAchievement.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def awards_and_achievement_params
      parameters = params.require(:awards_and_achievement).permit(:bn_nominal_rolls_id, :awards, :awarding_date, :location, :remarks)
      parameters["bn_nominal_roll_id"] = params["bn_nominal_roll_id"]
      parameters
    end
end
