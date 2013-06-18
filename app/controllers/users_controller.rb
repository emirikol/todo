class UsersController < ApplicationController

  def new
    redirect_to notes_path if current_user
    @user = User.new
  end

  def create
    @user = User.where(email: params[:user][:email]).first || User.create(params[:user])
    if @user.valid?
      session[:user] = @user.id
      redirect_to notes_path
    else
      render :new
    end
  end

end
