class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(email: params[:session][:email])

    if @user && @user.authenticate(params[:session][:password])
      if @user.email_confirmed
        session[:user_id] = @user.id
        redirect_to user_path(@user)
      else 
        #just for testing perpose should be taken out
        session[:user_id] = @user.id
        redirect_to user_path(@user)
        #render 'new'
      end
    else
      flash[:danger] = 'something dident work right'
      render 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to '/'
  end
end
