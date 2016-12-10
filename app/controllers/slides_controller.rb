class SlidesController < ApplicationController
  before_action(:require_user)

  def new
    @user = User.find(params[:user_id])
    @still = Still.find(params[:still_id])
    @slide = Slide.new
    @slide.build_still
  end

  def edit
    @user = current_user
    @slide = Slide.find(params[:id])
    @still = Still.find(params[:still_id])
  end

  def create
    @user = User.find(params[:user_id])
    @still = Still.find(params[:still_id])
    @slide = Slide.create(slide_params)
    @slide.still = @still

    if @slide.save
      redirect_to user_still_path(current_user, @still)
    else
      render 'new'
    end
  end

  def update
    @user = current_user
    @still = Still.find(params[:still_id])
    @slide = Slide.find(params[:id])

    if @slide.update(slide_params)
      redirect_to user_still_path(current_user, @still)
    else
      render 'edit'
    end
  end

  private

  def slide_params
    params.require(:slide).permit(:text)
  end
end
