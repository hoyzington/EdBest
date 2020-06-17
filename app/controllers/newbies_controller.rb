class NewbiesController < ApplicationController

  before_action :set_newbie, only:[:show, :edit, :update, :destroy]


  def index
    @newbies = Newbie.all
  end

  def show
  end

  def new
    @newbie = Newbie.new
  end

  def create
    # byebug
    @newbie = Newbie.new(newbie_params)
    if @newbie.save
      # session[:id] = @newbie.id
      # flash[:notice] = "Welcome to EdBest, #{@newbie.first_name}!"
      redirect_to newby_path(@newbie)
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @newbie.update(newbie_params)
      # flash[:notice] = 'Your profile has been updated.'
      redirect_to @newbie
    else
      render 'edit'
    end
  end

  def destroy
    @newbie.destroy
    # session[:user_id] = nil if @newbie == current_user
    flash[:notice] = 'Account, courses, and all related data have been destroyed'
    redirect_to root_path
  end

  private

  def set_newbie
    @newbie = Newbie.find(params[:id])
  end

  def newbie_params
    params.require(:newbie).permit(:first_name, :last_name, :email, :password)
  end

end
