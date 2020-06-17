class ApplicationController < ActionController::Base

  def current_expert
    @current_expert ||= Expert.find(session[:user_id]) if session[:user_id]
  end

  def current_newbie
    @current_newbie ||= Newbie.find(session[:user_id]) if session[:user_id]
  end

  def logged_in?
    !!current_expert || !!current_newbie
  end

  def require_user
    if !logged_in?
      flash[:alert] = "You must log in first."
      redirect_to login_path
    end
  end

end
