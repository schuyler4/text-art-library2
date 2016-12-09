class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by_email(params[:session][:password])

    if @user && @user.authenticate(params[:session][:password])
      session[:user_id] = @user.id
      redirect_to user_path(@user)
      puts "logged in"
    else
      render 'new'
      puts "cant log in"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to '/'
  end
end
