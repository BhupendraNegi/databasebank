class ArmyCoursesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_army_course, only: %i[ edit update destroy ]

  # GET /army_courses/new
  def new
    @army_course = ArmyCourse.new
  end

  # GET /army_courses/1/edit
  def edit
  end

  # POST /army_courses or /army_courses.json
  def create
    @army_course = ArmyCourse.new(army_course_params)

    respond_to do |format|
      if @army_course.save
        format.html { redirect_to bn_nominal_roll_url(@army_course.bn_nominal_roll), notice: "Army course was successfully created." }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /army_courses/1 or /army_courses/1.json
  def update
    respond_to do |format|
      if @army_course.update(army_course_params)
        format.html { redirect_to bn_nominal_roll_url(@army_course.bn_nominal_roll), notice: "Army course was successfully updated." }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /army_courses/1 or /army_courses/1.json
  def destroy
    @army_course.destroy

    respond_to do |format|
      format.html { redirect_to bn_nominal_roll_url(@army_course.bn_nominal_roll), notice: "Army course was successfully destroyed." }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_army_course
      @army_course = ArmyCourse.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def army_course_params
      parameters = params.require(:army_course).permit(:bn_nominal_rolls_id, :course, :course_grading, :location, :remarks)
      parameters["bn_nominal_roll_id"] = params["bn_nominal_roll_id"]
      parameters
    end
end
