class AnimationSlideController < ApplicationController
	before_action :require_user

	def new
		@user = User.find(params[:user_id])
		@animation = Animation.find(params[:animation_id])
		@slide = @animation.slides.build
	end

	def edit
		@user = User.find(params[:user_id])
		@animation = Animation.find(params[:animation_id])
		@slide = @animation.slides.build
	end

	def create
		@user = current_user
		@animation = Animation.find(params[:animation_id])
		@slide = @animation.slides.create(slide_params)

		if @slide.save
			redirect_to new_user_animation_slide_path(@animation)
		else
			render 'new'
		end
	end

	def update
		@user = User.find(params[:user_id])
		@animation = Animation.find(params[:animation_id])
		@slide = Slide.find(params[:id])

		if @slide.save
			redirect_to new_user_animation_slide_path(@animation)
		else 
			render 'edit'
		end
	end

	private

	def slide_params
		params.require(:slide).permit(:text)
	end
end