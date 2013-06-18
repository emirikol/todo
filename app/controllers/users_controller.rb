class UsersController < ApplicationController

  def new
    redirect_to notes_path if current_user
    @user = User.new
  end

  def create
    @user = User.create(params[:user])
    session[:user] = @user.id if @user.valid?
  end

end
