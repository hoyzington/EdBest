class ExpertsController < ApplicationController

  before_action :set_expert, only:[:show, :edit, :update, :destroy]
  

  def index
    @experts = Expert.all
  end

  def show
  end

  def new
    @expert = Expert.new
  end

  def create
    @expert = Expert.new(expert_params)
    if @expert.save
      session[:user_id] = @expert.id
      # flash[:notice] = 'Congratulations! You have been accepted as an EdBest Expert.'
      redirect_to @expert
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @expert.update(expert_params)
      # flash[:notice] = 'Your profile has been updated.'
      redirect_to @expert
    else
      render 'edit'
    end
  end

  def destroy
    @expert.destroy
    session[:user_id] = nil if @expert == current_expert
    #flash[:notice] = 'Account, courses, and all related data have been destroyed'
    redirect_to root_path
  end

  private

  def course
    if params[:offered_course_id]
      OfferedCourse.find(params[:offered_course_id])
    end
  end

  def set_expert
    @expert = Expert.find(params[:id] || course.expert.id)
  end

  def expert_params
    params.require(:expert).permit(:first_name, :last_name, :email, :password, :bio)
  end

end
