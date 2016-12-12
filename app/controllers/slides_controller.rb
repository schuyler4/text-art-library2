class SlidesController < ApplicationController
  before_action :require_user
  before_action :require_permission, only: [:update, :edit]

  def require_permission
    if current_user != Slide.find(params[:id]).animation.user
      redirect_to root_path
    end
  end

  def new
    @user = current_user
    @animation = Animation.find(params[:animation_id])
    @slide = @animation.slides.build
  end

  def edit
    @user = current_user
    @animation = Animation.find(params[:animation_id])
    @slide = Slide.find(params[:id])
  end

  def create
    @user = current_user
    @animation = Animation.find(params[:animation_id])
    @slide = @animation.slides.create(slide_params)

    if @slide.save
      redirect_to new_user_animation_slide_path(@user, @animation)
    else
      render 'new'
    end
  end

  def update
    @user = current_user
    @animation = Animation.find(params[:animation_id])
    @slide = Slide.find(params[:id])

    if @slide.update(slide_params)
      redirect_to new_user_animation_slide_path(@user, @animation)
    else
      render 'new'
    end
  end

  private

  def slide_params
    params.require(:slide).permit(:text)
  end
end
