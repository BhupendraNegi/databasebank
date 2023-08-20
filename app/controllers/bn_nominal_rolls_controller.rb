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

  def indl_veh_details
    @q = IndlVehDetail.joins(:bn_nominal_roll)
    @q = @q.ransack(params[:q])
    @indl_veh_details =  @q.result(distinct: true).includes(:bn_nominal_roll)

    if params[:commit].present?
      @indl_veh_details = @indl_veh_details.where("bn_nominal_rolls.name = ?", params[:name]) if params[:name].present?
      @indl_veh_details = @indl_veh_details.where("bn_nominal_rolls.army_no = ?", params[:army_no]) if params[:army_no].present?
      @indl_veh_details = @indl_veh_details.where("bn_nominal_rolls.rank = ?", params[:rank]) if params[:rank].present?
      @indl_veh_details = @indl_veh_details.where("bn_nominal_rolls.coy = ?", params[:coy]) if params[:coy].present? && !(params[:coy] == "ALL")
      @indl_veh_details = @indl_veh_details.where(type_of_veh: params[:type_of_veh]) if params[:type_of_veh].present?
      @indl_veh_details = @indl_veh_details.where(veh_no: params[:veh_no]) if params[:veh_no].present?
      @indl_veh_details = @indl_veh_details.where(location: params[:location]) if params[:location].present?
    end
    @indl_veh_details = @indl_veh_details.page(params[:page]).per(75)
  end

  def indl_details
    @q = BnNominalRoll.joins(:indl_detail, :army_courses, :ere_details, :bn_family_member_detail, :awards_and_achievements)
    @q = @q.ransack(params[:q])
    @indl_details =  @q.result(distinct: true).includes(:indl_detail, :army_courses, :ere_details, :bn_family_member_detail, :awards_and_achievements)

    if params[:commit].present?
      @indl_details = @indl_details.where(name: params[:name]) if params[:name].present?
      @indl_details = @indl_details.where(army_no: params[:army_no]) if params[:army_no].present?
      @indl_details = @indl_details.where(rank: params[:rank]) if params[:rank].present?
      @indl_details = @indl_details.where(trade: params[:trade]) if params[:trade].present?
      @indl_details = @indl_details.where(date_of_tos_in_unit: params[:date_of_tos_in_unit]) if params[:dt_of_tos_in_unit].present?
      @indl_details = @indl_details.where(pers_med_cat: params[:pers_med_cat]) if params[:pers_med_cat].present?
      @indl_details = @indl_details.where(dob: params[:dob]) if params[:dob].present?
      @indl_details = @indl_details.where(civ_edn: params[:civ_edn]) if params[:civ_edn].present?
      @indl_details = @indl_details.where(marital_status: params[:marital_status]) if params[:marital_status].present?
      @indl_details = @indl_details.where(coy: params[:coy]) if params[:coy].present? && !(params[:coy] == "ALL")
      @indl_details = @indl_details.where("indl_details.pl = ?", params[:pl]) if params[:pl].present?
      @indl_details = @indl_details.where("indl_details.sec = ?", params[:sec]) if params[:sec].present?
      @indl_details = @indl_details.where("indl_details.i_card_number = ?", params[:i_card_number]) if params[:i_card_number].present?
      @indl_details = @indl_details.where("indl_details.blood_group = ?", params[:blood_group]) if params[:blood_group].present?
      @indl_details = @indl_details.where("indl_details.appt = ?", params[:appt]) if params[:appt].present?
      @indl_details = @indl_details.where("indl_details.dt_of_enrollment = ?", params[:dt_of_enrollment]) if params[:dt_of_enrollment].present?
      @indl_details = @indl_details.where("indl_details.dt_of_marriage = ?", params[:dt_of_marriage]) if params[:dt_of_marriage].present?
      @indl_details = @indl_details.where("indl_details.dscp_record = ?", params[:dscp_record]) if params[:dscp_record].present?
      @indl_details = @indl_details.where("indl_details.mob_no_indl = ?", params[:mob_no_indl]) if params[:mob_no_indl].present?
      @indl_details = @indl_details.where("indl_details.mob_no_res = ?", params[:mob_no_res]) if params[:mob_no_res].present?
      @indl_details = @indl_details.where("indl_details.pan_no = ?", params[:pan_no]) if params[:pan_no].present?
      @indl_details = @indl_details.where("indl_details.uid_no = ?", params[:uid_no]) if params[:uid_no].present?
      @indl_details = @indl_details.where("indl_details.lve_plan = ?", params[:lve_plan]) if params[:lve_plan].present?
      @indl_details = @indl_details.where("indl_details.location = ?", params[:location]) if params[:location].present?
      @indl_details = @indl_details.where("indl_details.email_id = ?", params[:email_id]) if params[:email_id].present?
      @indl_details = @indl_details.where("indl_details.address = ?", params[:address]) if params[:address].present?
    end
    @indl_details = @indl_details.page(params[:page]).per(75)
  end

  def awards_and_achievements
    @q = AwardsAndAchievement.joins(:bn_nominal_roll)
    @q = @q.ransack(params[:q])
    @awards_and_achievements =  @q.result(distinct: true).includes(:bn_nominal_roll)

    if params[:commit].present?
      @awards_and_achievements = @awards_and_achievements.where("bn_nominal_rolls.name = ?", params[:name]) if params[:name].present?
      @awards_and_achievements = @awards_and_achievements.where("bn_nominal_rolls.army_no = ?", params[:army_no]) if params[:army_no].present?
      @awards_and_achievements = @awards_and_achievements.where("bn_nominal_rolls.rank = ?", params[:rank]) if params[:rank].present?
      @awards_and_achievements = @awards_and_achievements.where("bn_nominal_rolls.trade = ?", params[:trade]) if params[:trade].present?
      @awards_and_achievements = @awards_and_achievements.where("bn_nominal_rolls.coy = ?", params[:coy]) if params[:coy].present? && !(params[:coy] == "ALL")
      @awards_and_achievements = @awards_and_achievements.where(awards: params[:awards]) if params[:awards].present?
      @awards_and_achievements = @awards_and_achievements.where(awarding_date: params[:awarding_date]) if params[:awarding_date].present?
      @awards_and_achievements = @awards_and_achievements.where(location: params[:location]) if params[:location].present?
    end
    @awards_and_achievements = @awards_and_achievements.page(params[:page]).per(75)
  end

  def bn_family_member_details
    @q = BnFamilyMemberDetail.joins(:bn_nominal_roll)
    @q = @q.ransack(params[:q])
    @bn_family_member_details =  @q.result(distinct: true).includes(:bn_nominal_roll)

    if params[:commit].present?
      @bn_family_member_details = @bn_family_member_details.where("bn_nominal_rolls.name = ?", params[:name]) if params[:name].present?
      @bn_family_member_details = @bn_family_member_details.where("bn_nominal_rolls.army_no = ?", params[:army_no]) if params[:army_no].present?
      @bn_family_member_details = @bn_family_member_details.where("bn_nominal_rolls.rank = ?", params[:rank]) if params[:rank].present?
      @bn_family_member_details = @bn_family_member_details.where("bn_nominal_rolls.trade = ?", params[:trade]) if params[:trade].present?
      @bn_family_member_details = @bn_family_member_details.where("bn_nominal_rolls.dob = ?", params[:dob]) if params[:dob].present?
      @bn_family_member_details = @bn_family_member_details.where("bn_nominal_rolls.coy = ?", params[:coy]) if params[:coy].present? && !(params[:coy] == "ALL")
      @bn_family_member_details = @bn_family_member_details.where(wife_name: params[:wife_name]) if params[:wife_name].present?
      @bn_family_member_details = @bn_family_member_details.where(dob_wife: params[:dob_wife]) if params[:dob_wife].present?
      @bn_family_member_details = @bn_family_member_details.where(no_of_children: params[:no_of_children]) if params[:no_of_children].present?
      @bn_family_member_details = @bn_family_member_details.where(present_address: params[:present_address]) if params[:present_address].present?
      @bn_family_member_details = @bn_family_member_details.where(permanent_address: params[:permanent_address]) if params[:permanent_address].present?
      @bn_family_member_details = @bn_family_member_details.where(qtr_occupation_date: params[:qtr_occupation_date]) if params[:qtr_occupation_date].present?
      @bn_family_member_details = @bn_family_member_details.where(family_problem: params[:family_problem]) if params[:family_problem].present?
      @bn_family_member_details = @bn_family_member_details.where(mob_no_indl: params[:mob_no_indl]) if params[:mob_no_indl].present?
      @bn_family_member_details = @bn_family_member_details.where(mob_no_res: params[:mob_no_res]) if params[:mob_no_res].present?
    end
    @bn_family_member_details = @bn_family_member_details.page(params[:page]).per(75)
  end

  def cor_drinker_non_drinkers
    @q = CorDrinkerNonDrinker.joins(:bn_nominal_roll)
    @q = @q.ransack(params[:q])
    @cor_drinker_non_drinkers =  @q.result(distinct: true).includes(:bn_nominal_roll)

    if params[:commit].present?
      @cor_drinker_non_drinkers = @cor_drinker_non_drinkers.where("bn_nominal_rolls.name = ?", params[:name]) if params[:name].present?
      @cor_drinker_non_drinkers = @cor_drinker_non_drinkers.where("bn_nominal_rolls.army_no = ?", params[:army_no]) if params[:army_no].present?
      @cor_drinker_non_drinkers = @cor_drinker_non_drinkers.where("bn_nominal_rolls.rank = ?", params[:rank]) if params[:rank].present?
      @cor_drinker_non_drinkers = @cor_drinker_non_drinkers.where("bn_nominal_rolls.trade = ?", params[:trade]) if params[:trade].present?
      @cor_drinker_non_drinkers = @cor_drinker_non_drinkers.where("bn_nominal_rolls.coy = ?", params[:coy]) if params[:coy].present? && !(params[:coy] == "ALL")
      @cor_drinker_non_drinkers = @cor_drinker_non_drinkers.where(drinker_non_drinker: params[:drinker_non_drinker]) if params[:drinker_non_drinker].present?
    end
    @cor_drinker_non_drinkers = @cor_drinker_non_drinkers.page(params[:page]).per(75)
  end

  def leave_states
    @q = LeaveState.joins(:bn_nominal_roll)
    @q = @q.ransack(params[:q])
    @leave_states =  @q.result(distinct: true).includes(:bn_nominal_roll)

    if params[:commit].present?
      @leave_states = @leave_states.where("bn_nominal_rolls.name = ?", params[:name]) if params[:name].present?
      @leave_states = @leave_states.where("bn_nominal_rolls.army_no = ?", params[:army_no]) if params[:army_no].present?
      @leave_states = @leave_states.where("bn_nominal_rolls.rank = ?", params[:rank]) if params[:rank].present?
      @leave_states = @leave_states.where("bn_nominal_rolls.trade = ?", params[:trade]) if params[:trade].present?
      @leave_states = @leave_states.where("bn_nominal_rolls.coy = ?", params[:coy]) if params[:coy].present? && !(params[:coy] == "ALL")
      @leave_states = @leave_states.where(al: params[:al]) if params[:al].present?
      @leave_states = @leave_states.where(cl: params[:cl]) if params[:cl].present?
      @leave_states = @leave_states.where(furlough: params[:furlough]) if params[:furlough].present?
    end
    @leave_states = @leave_states.page(params[:page]).per(75)
  end

  
  def max_health_reports
    @q = MaxHealthReport.joins(:bn_nominal_roll)
    @q = @q.ransack(params[:q])
    @max_health_reports =  @q.result(distinct: true).includes(:bn_nominal_roll)

    if params[:commit].present?
      @max_health_reports = @max_health_reports.where("bn_nominal_rolls.name = ?", params[:name]) if params[:name].present?
      @max_health_reports = @max_health_reports.where("bn_nominal_rolls.army_no = ?", params[:army_no]) if params[:army_no].present?
      @max_health_reports = @max_health_reports.where("bn_nominal_rolls.rank = ?", params[:rank]) if params[:rank].present?
      @max_health_reports = @max_health_reports.where("bn_nominal_rolls.trade = ?", params[:trade]) if params[:trade].present?
      @max_health_reports = @max_health_reports.where("bn_nominal_rolls.coy = ?", params[:coy]) if params[:coy].present? && !(params[:coy] == "ALL")
      @max_health_reports = @max_health_reports.where(barcode: params[:barcode]) if params[:barcode].present?
      @max_health_reports = @max_health_reports.where(ht: params[:ht]) if params[:ht].present?
      @max_health_reports = @max_health_reports.where(wt: params[:wt]) if params[:wt].present?
      @max_health_reports = @max_health_reports.where(bp: params[:bp]) if params[:bp].present?
      @max_health_reports = @max_health_reports.where(haemoglobin: params[:haemoglobin]) if params[:haemoglobin].present?
      @max_health_reports = @max_health_reports.where(leucocyte: params[:leucocyte]) if params[:leucocyte].present?
      @max_health_reports = @max_health_reports.where(neutrophiles: params[:neutrophiles]) if params[:neutrophiles].present?
      @max_health_reports = @max_health_reports.where(lymphocytes: params[:lymphocytes]) if params[:lymphocytes].present?
      @max_health_reports = @max_health_reports.where(monocytes: params[:monocytes]) if params[:monocytes].present?
      @max_health_reports = @max_health_reports.where(eosinophiles: params[:eosinophiles]) if params[:eosinophiles].present?
      @max_health_reports = @max_health_reports.where(basophiles: params[:basophiles]) if params[:basophiles].present?
      @max_health_reports = @max_health_reports.where(glucose: params[:glucose]) if params[:glucose].present?
      @max_health_reports = @max_health_reports.where(hbaglycosylated: params[:hbaglycosylated]) if params[:hbaglycosylated].present?
      @max_health_reports = @max_health_reports.where(thyroid: params[:thyroid]) if params[:thyroid].present?
      @max_health_reports = @max_health_reports.where(urea: params[:urea]) if params[:urea].present?
      @max_health_reports = @max_health_reports.where(creatinine: params[:creatinine]) if params[:creatinine].present?
      @max_health_reports = @max_health_reports.where(billirubin: params[:billirubin]) if params[:billirubin].present?
      @max_health_reports = @max_health_reports.where(sgot: params[:sgot]) if params[:sgot].present?
      @max_health_reports = @max_health_reports.where(sgpt: params[:sgpt]) if params[:sgpt].present?
      @max_health_reports = @max_health_reports.where(cholesterol: params[:cholesterol]) if params[:cholesterol].present?
      @max_health_reports = @max_health_reports.where(triglycerides: params[:triglycerides]) if params[:triglycerides].present?
      @max_health_reports = @max_health_reports.where(spg: params[:spg]) if params[:spg].present?
    end
    @max_health_reports = @max_health_reports.page(params[:page]).per(75)
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
      params.fetch(:bn_nominal_roll, {}).permit(:army_no, :rank, :trade, :name, :date_of_tos_in_unit, :coy, :civ_edn, :marital_status ,:remarks, :pers_med_cat, :dob)
    end
end
