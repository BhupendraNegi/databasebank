class BnNominalRollsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_bn_nominal_roll, only: %i[ show edit update destroy ]

  def index
    @q = BnNominalRoll
    if params[:commit].present?
      @q = @q.where(name: params[:name]) if params[:name].present?
      @q = @q.where(army_no: params[:army_no]) if params[:army_no].present?
      @q = @q.where(rank: params[:rank]) if params[:rank].present?
      @q = @q.where(trade: params[:trade]) if params[:trade].present?
      @q = @q.where(marital_status: params[:marital_status]) if params[:marital_status].present?
      @q = @q.where(coy: params[:coy]) if params[:coy].present? && !(params[:coy] == "ALL")
    end
    @q = @q.ransack(params[:q])
    @bn_nominal_rolls = @q.result(distinct: true).page(params[:page]).per(75)
  end

  # GET /bn_nominal_rolls/1 or /bn_nominal_rolls/1.json
  def show
    @bn_lmc_pers = @bn_nominal_roll.bn_lmc_pers
    @coy_leave_details = @bn_nominal_roll.coy_leave_detail
    @bn_punishment_pers = @bn_nominal_roll.bn_punishment_pers
    @ere_details = @bn_nominal_roll.ere_details
    @pers_in_mhs = @bn_nominal_roll.pers_in_mhs
    @bn_sports_teams = @bn_nominal_roll.bn_sports_teams
    @army_courses = @bn_nominal_roll.army_courses
    @att_pers = @bn_nominal_roll.att_pers
    @indl_veh_details = @bn_nominal_roll.indl_veh_details
    @indl_details = @bn_nominal_roll.indl_detail
    @awards_and_achievements = @bn_nominal_roll.awards_and_achievements
    @cor_drinker_non_drinkers = @bn_nominal_roll.cor_drinker_non_drinker
    @leave_states = @bn_nominal_roll.leave_state
    @max_health_reports = @bn_nominal_roll.max_health_report
    @bn_family_member_details = @bn_nominal_roll.bn_family_member_detail
  end

  # GET /bn_nominal_rolls/new
  def new
    @bn_nominal_roll = BnNominalRoll.new
  end

  # GET /bn_nominal_rolls/1/edit
  def edit
  end

  # POST /bn_nominal_rolls or /bn_nominal_rolls.json
  def create
    @bn_nominal_roll = BnNominalRoll.new(bn_nominal_roll_params)

    respond_to do |format|
      if @bn_nominal_roll.save
        format.html { redirect_to bn_nominal_roll_url(@bn_nominal_roll), notice: "Bn nominal roll was successfully created." }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /bn_nominal_rolls/1 or /bn_nominal_rolls/1.json
  def update
    respond_to do |format|
      if @bn_nominal_roll.update(bn_nominal_roll_params)
        format.html { redirect_to bn_nominal_roll_url(@bn_nominal_roll), notice: "Bn nominal roll was successfully updated." }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def coy_nominal_roll
    @q = BnNominalRoll
    if params[:commit].present?
      @q = @q.where(name: params[:name]) if params[:name].present?
      @q = @q.where(army_no: params[:army_no]) if params[:army_no].present?
      @q = @q.where(rank: params[:rank]) if params[:rank].present?
      @q = @q.where(trade: params[:trade]) if params[:trade].present?
      @q = @q.where(marital_status: params[:marital_status]) if params[:marital_status].present?
      @q = @q.where(coy: params[:coy]) if params[:coy].present? && !(params[:coy] == "ALL")
    end
    @q = @q.ransack(params[:q])
    @bn_nominal_rolls = @q.result(distinct: true).page(params[:page]).per(75)
  end

  def coy_leave_detail
    @q = CoyLeaveDetail.joins(:bn_nominal_roll)
    @q = @q.ransack(params[:q])
    @coy_leave_detail =  @q.result(distinct: true).includes(:bn_nominal_roll)

    if params[:commit].present?
      @coy_leave_detail = @coy_leave_detail.where("bn_nominal_rolls.name = ?", params[:name]) if params[:name].present?
      @coy_leave_detail = @coy_leave_detail.where("bn_nominal_rolls.army_no = ?", params[:army_no]) if params[:army_no].present?
      @coy_leave_detail = @coy_leave_detail.where("bn_nominal_rolls.rank = ?", params[:rank]) if params[:rank].present?
      @coy_leave_detail = @coy_leave_detail.where("bn_nominal_rolls.coy = ?", params[:coy]) if params[:coy].present? && !(params[:coy] == "ALL")
    end    
    @coy_leave_detail = @coy_leave_detail.page(params[:page]).per(75)
  end

  def bn_lmc_pers
    @q = BnLmcPer.joins(:bn_nominal_roll)
    @q = @q.ransack(params[:q])
    @bn_lmc_pers =  @q.result(distinct: true).includes(:bn_nominal_roll)

    if params[:commit].present?
      @bn_lmc_pers = @bn_lmc_pers.where("bn_nominal_rolls.name = ?", params[:name]) if params[:name].present?
      @bn_lmc_pers = @bn_lmc_pers.where("bn_nominal_rolls.army_no = ?", params[:army_no]) if params[:army_no].present?
      @bn_lmc_pers = @bn_lmc_pers.where("bn_nominal_rolls.rank = ?", params[:rank]) if params[:rank].present?
      @bn_lmc_pers = @bn_lmc_pers.where("bn_nominal_rolls.pers_med_cat = ?", params[:pers_med_cat]) if params[:pers_med_cat].present?
      @bn_lmc_pers = @bn_lmc_pers.where("bn_nominal_rolls.coy = ?", params[:coy]) if params[:coy].present? && !(params[:coy] == "ALL")
      @bn_lmc_pers = @bn_lmc_pers.where(diagonosis: params[:diagonosis]) if params[:diagonosis].present?
      @bn_lmc_pers = @bn_lmc_pers.where(date_of_first_placed_in_lmc: params[:date_of_first_placed_in_lmc]) if params[:date_of_first_placed_in_lmc].present?
      @bn_lmc_pers = @bn_lmc_pers.where(date_of_next_med_review: params[:date_of_next_med_review]) if params[:date_of_next_med_review].present?
      @bn_lmc_pers = @bn_lmc_pers.where(location: params[:location]) if params[:location].present?
    end
    @bn_lmc_pers = @bn_lmc_pers.page(params[:page]).per(75)
  end

  
  def ere_details
    @q = EreDetail.joins(:bn_nominal_roll)
    @q = @q.ransack(params[:q])
    @ere_details =  @q.result(distinct: true).includes(:bn_nominal_roll)

    if params[:commit].present?
      @ere_details = @ere_details.where("bn_nominal_rolls.name = ?", params[:name]) if params[:name].present?
      @ere_details = @ere_details.where("bn_nominal_rolls.army_no = ?", params[:army_no]) if params[:army_no].present?
      @ere_details = @ere_details.where("bn_nominal_rolls.rank = ?", params[:rank]) if params[:rank].present?
      @ere_details = @ere_details.where("bn_nominal_rolls.coy = ?", params[:coy]) if params[:coy].present? && !(params[:coy] == "ALL")
      @ere_details = @ere_details.where(ere_unit: params[:ere_unit]) if params[:ere_unit].present?
      @ere_details = @ere_details.where(ere_location: params[:ere_location]) if params[:ere_location].present?
      @ere_details = @ere_details.where(date_of_sos_to_ere: params[:date_of_sos_to_ere]) if params[:date_of_sos_to_ere].present?
      @ere_details = @ere_details.where(date_of_rtu_to_unit: params[:date_of_rtu_to_unit]) if params[:date_of_rtu_to_unit].present?
      @ere_details = @ere_details.where(tenure: params[:tenure]) if params[:tenure].present?
    end
    @ere_details = @ere_details.page(params[:page]).per(75)
  end

  def bn_punishment_pers
    @q = BnPunishmentPer.joins(:bn_nominal_roll)
    @q = @q.ransack(params[:q])
    @bn_punishment_pers =  @q.result(distinct: true).includes(:bn_nominal_roll)

    if params[:commit].present?
      @bn_punishment_pers = @bn_punishment_pers.where("bn_nominal_rolls.name = ?", params[:name]) if params[:name].present?
      @bn_punishment_pers = @bn_punishment_pers.where("bn_nominal_rolls.army_no = ?", params[:army_no]) if params[:army_no].present?
      @bn_punishment_pers = @bn_punishment_pers.where("bn_nominal_rolls.rank = ?", params[:rank]) if params[:rank].present?
      @bn_punishment_pers = @bn_punishment_pers.where("bn_nominal_rolls.coy = ?", params[:coy]) if params[:coy].present? && !(params[:coy] == "ALL")
      @bn_punishment_pers = @bn_punishment_pers.where(red_black: params[:red_black]) if params[:red_black].present?
      @bn_punishment_pers = @bn_punishment_pers.where(duration_on_period: params[:duration_on_period]) if params[:duration_on_period].present?
      @bn_punishment_pers = @bn_punishment_pers.where(army_act: params[:army_act]) if params[:army_act].present?
      @bn_punishment_pers = @bn_punishment_pers.where(punishment_award_ed: params[:punishment_award_ed]) if params[:punishment_award_ed].present?
      @bn_punishment_pers = @bn_punishment_pers.where(location: params[:location]) if params[:location].present?
    end
    @bn_punishment_pers = @bn_punishment_pers.page(params[:page]).per(75)
  end

  def pers_in_mhs
    @q = PersInMh.joins(:bn_nominal_roll)
    @q = @q.ransack(params[:q])
    @pers_in_mhs =  @q.result(distinct: true).includes(:bn_nominal_roll)

    if params[:commit].present?
      @pers_in_mhs = @pers_in_mhs.where("bn_nominal_rolls.name = ?", params[:name]) if params[:name].present?
      @pers_in_mhs = @pers_in_mhs.where("bn_nominal_rolls.army_no = ?", params[:army_no]) if params[:army_no].present?
      @pers_in_mhs = @pers_in_mhs.where("bn_nominal_rolls.rank = ?", params[:rank]) if params[:rank].present?
      @pers_in_mhs = @pers_in_mhs.where("bn_nominal_rolls.coy = ?", params[:coy]) if params[:coy].present? && !(params[:coy] == "ALL")
      @pers_in_mhs = @pers_in_mhs.where(admitted_date: params[:admitted_date]) if params[:admitted_date].present?
      @pers_in_mhs = @pers_in_mhs.where(no_of_days_in_mh: params[:no_of_days_in_mh]) if params[:no_of_days_in_mh].present?
      @pers_in_mhs = @pers_in_mhs.where(diagonosis: params[:diagonosis]) if params[:diagonosis].present?
    end
    @pers_in_mhs = @pers_in_mhs.page(params[:page]).per(75)
  end

  def bn_sports_teams
    @q = BnSportsTeam.joins(:bn_nominal_roll)
    @q = @q.ransack(params[:q])
    @bn_sports_teams =  @q.result(distinct: true).includes(:bn_nominal_roll)

    if params[:commit].present?
      @bn_sports_teams = @bn_sports_teams.where("bn_nominal_rolls.name = ?", params[:name]) if params[:name].present?
      @bn_sports_teams = @bn_sports_teams.where("bn_nominal_rolls.army_no = ?", params[:army_no]) if params[:army_no].present?
      @bn_sports_teams = @bn_sports_teams.where("bn_nominal_rolls.rank = ?", params[:rank]) if params[:rank].present?
      @bn_sports_teams = @bn_sports_teams.where("bn_nominal_rolls.coy = ?", params[:coy]) if params[:coy].present? && !(params[:coy] == "ALL")
      @bn_sports_teams = @bn_sports_teams.where(game_level: params[:game_level]) if params[:game_level].present?
      @bn_sports_teams = @bn_sports_teams.where(game: params[:game]) if params[:game].present?
    end
    @bn_sports_teams = @bn_sports_teams.page(params[:page]).per(75)
  end
  
  def army_courses
    @q = ArmyCourse.joins(:bn_nominal_roll)
    @q = @q.ransack(params[:q])
    @army_courses =  @q.result(distinct: true).includes(:bn_nominal_roll)

    if params[:commit].present?
      @army_courses = @army_courses.where("bn_nominal_rolls.name = ?", params[:name]) if params[:name].present?
      @army_courses = @army_courses.where("bn_nominal_rolls.army_no = ?", params[:army_no]) if params[:army_no].present?
      @army_courses = @army_courses.where("bn_nominal_rolls.rank = ?", params[:rank]) if params[:rank].present?
      @army_courses = @army_courses.where("bn_nominal_rolls.coy = ?", params[:coy]) if params[:coy].present? && !(params[:coy] == "ALL")
      @army_courses = @army_courses.where(course: params[:course]) if params[:course].present?
      @army_courses = @army_courses.where(course_grading: params[:course_grading]) if params[:course_grading].present?
      @army_courses = @army_courses.where(location: params[:location]) if params[:location].present?
    end
    @army_courses = @army_courses.page(params[:page]).per(75)
  end
  
  def att_pers
    @q = AttPer.joins(:bn_nominal_roll)
    @q = @q.ransack(params[:q])
    @att_pers =  @q.result(distinct: true).includes(:bn_nominal_roll)

    if params[:commit].present?
      @att_pers = @att_pers.where("bn_nominal_rolls.name = ?", params[:name]) if params[:name].present?
      @att_pers = @att_pers.where("bn_nominal_rolls.army_no = ?", params[:army_no]) if params[:army_no].present?
      @att_pers = @att_pers.where("bn_nominal_rolls.rank = ?", params[:rank]) if params[:rank].present?
      @att_pers = @att_pers.where("bn_nominal_rolls.coy = ?", params[:coy]) if params[:coy].present? && !(params[:coy] == "ALL")
      @att_pers = @att_pers.where(unit: params[:unit]) if params[:unit].present?
      @att_pers = @att_pers.where(unit_location: params[:unit_location]) if params[:unit_location].present?
      @att_pers = @att_pers.where(att_as_on: params[:att_as_on]) if params[:att_as_on].present?
    end
    @att_pers = @att_pers.page(params[:page]).per(75)
  end

  # DELETE /bn_nominal_rolls/1 or /bn_nominal_rolls/1.json
  def destroy
    @bn_nominal_roll.destroy

    respond_to do |format|
      format.html { redirect_to home_index_url, notice: "Bn nominal roll was successfully destroyed." }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bn_nominal_roll
      @bn_nominal_roll = BnNominalRoll.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def bn_nominal_roll_params
      params.fetch(:bn_nominal_roll, {}).permit(:army_no, :rank, :trade, :name, :date_of_tos_in_unit, :coy, :civ_edn, :marital_status ,:remarks, :pers_med_cat)
    end
end
