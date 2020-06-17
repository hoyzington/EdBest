class SessionsController < ApplicationController

  def new
  end

  def create
    if params[:session][:expert] == "1"
      user = Expert.find_by(email: params[:session][:email].downcase)
    else
      user = Newbie.find_by(email: params[:session][:email].downcase)
    end
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      flash[:notice] = "Welcome back, #{user.first_name}!"
      redirect_to user
    else
      flash.now[:alert] = "There was something wrong with your login details."
      render 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = "Come back soon!"
    redirect_to root_path
  end

end
