class ApplicationController < ActionController::Base
  protect_from_forgery


  def authenticate_user
    if current_user.nil?
      redirect_to new_user_path
      false
    else
      true
    end
  end

  def current_user
    @current_user ||= session[:user] ? User.find(session[:user]) : nil
  end

end
