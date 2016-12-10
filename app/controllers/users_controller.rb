class UsersController < ApplicationController
  before_action(:require_user, only: [:show])

  def show
    @user = User.find(current_user.id)
    @stills = @user.stills.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      render 'new'
    end
  end

  private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password)
  end
end
