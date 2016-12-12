class StillsController < ApplicationController
  before_action :require_user
  before_filter :require_permission, only: [:edit, :update, :destroy]

  def require_permission
    if current_user != Still.find(params[:id]).user
      redirect_to root_path
    end
  end

  def show
    @still = Still.find(params[:id])
  end

  def new
    @user = current_user
    @still = Still.new
  end

  def edit
    @still = Still.find(params[:id])
  end

  def create
    @user = current_user
    @still = @user.stills.create(still_params)

    if @still.save
      redirect_to user_still_path(current_user, @still)
    else
      render 'new'
    end
  end

  def update
    @still = Still.find(params[:id])

    if @still.update(still_params)
      redirect_to user_still_path(@still)
    else
      render 'edit'
    end
  end

  def destroy
    @still = Still.find(params[:id])
    @still.destroy
    redirect_to user_path(current_user)
  end

  private

  def still_params
    params.require(:still).permit(:title, :text)
  end

end
