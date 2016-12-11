class StillsController < ApplicationController
  before_action :require_user
  #before_action :require_editor, only: [:edit, :update, :destroy]

  def show
    @still = Still.find(params[:id])
    @slide = @still.slide
  end

  def new
    @user = current_user
    @still = Still.new
  end

  def edit
    @still = Still.find(params[:id])

    if @still.user.id != current_user.id
      redirect_to user_path(current_user)
    end
  end

  def create
    @user = current_user
    @still = @user.stills.create(still_params)

    if @still.save
      redirect_to new_user_still_slide_path(current_user, @still)
    else
      render 'new'
    end
  end

  def update
    @still = Still.find(params[:id])

    if @still.user == current_user
      if @still.update(still_params)
        redirect_to user_still_path(@still)
      else
        render 'edit'
      end
    else
      redirect_to user_path(current_user)
    end
  end

  def destroy
    if @still.user.id == current_user.id
      @still = Still.find(params[:id])
      @still.destroy
      redirect_to user_path(current_user)
    else 
      redirect_to user_path(current_user)
    end
  end

  private

  def still_params
    params.require(:still).permit(:title)
  end

end
