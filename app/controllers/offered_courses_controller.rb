class OfferedCoursesController < ApplicationController

  before_action :set_course, only:[:show, :edit, :update, :destroy]

  def new
    @o_course = OfferedCourse.new
  end

  def create
    @o_course = OfferedCourse.new(course_params)
    @o_course.expert = current_expert
    if @o_course.save
      #flash[:notice] = 'Course added successfully.'
      redirect_to @o_course.expert
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @o_course.update(course_params)
      #flash[:notice] = 'Course presentation was updated successfully.'
      redirect_to expert_offered_courses_path(@o_course.expert)
    else
      render 'edit'
    end
  end

  def index
    @o_courses = OfferedCourse.all
  end

  def show
  end

  def destroy
    @o_course.destroy
    redirect_to expert_offered_courses_path(@o_course.expert)
  end

  private

  def set_course
    @o_course = OfferedCourse.find(params[:id])
  end

  def course_params
    params.require(:offered_course).permit(:name, :description)
  end

end
