class UsersController < ApplicationController
  before_action(:require_user, only: [:show])

  def show
    @user = User.find(current_user.id)
    @stills = @user.stills.all
    @animations = @user.animations.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      #UserMailer.registration_confirmation(@user).deliver
      UserMailer.welcome_email(@user).deliver_now
      session[:user_id] = @user.id
      redirect_to root_url
    else
      render 'new'
    end
  end

  def confirm_email
    user = User.find_by_confirm_token(params[:id])

    if user
      user.email_active
      redirect_to user_path(user)
    else
      redirect_to root_url
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password)
  end

end
