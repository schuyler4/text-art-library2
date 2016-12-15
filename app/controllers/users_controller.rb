class UsersController < ApplicationController
  before_action :require_user, only: [:show]

  def show
    @user = User.find(current_user.id)
    @stills = @user.stills.all
    @animations = @user.animations.all

    puts "panda"
    puts @user.email_confirmed
    puts "panda"
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      UserMailer.welcome_email(@user).deliver_now
      redirect_to until_confirm_user_path(@user)
      session[:user_id] = @user.id
    else
      render 'new'
    end
  end

  def until_confirm
    @user = User.find(params[:id])
  end

  def resend_email
    @user = User.find(params[:id])
    UserMailer.welcome_email(@user).deliver_now
    redirect_to until_confirm_user_path(@user)
    puts "resent email"
  end

  def confirm_email
    @user = User.find_by_confirm_token(params[:id])

    if @user
      @user.email_active
      redirect_to user_path(@user)
    else
      redirect_to root_url
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password,
      :email_confirmed)
  end

end
