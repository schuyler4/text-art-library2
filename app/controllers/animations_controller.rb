class AnimationsController < ApplicationController
	before_action :require_user
	before_action :require_permission, only: [:edit, :update, :destroy]

	def require_permission
		if current_user != Animation.find(params[:id]).user
			redirect_to root_path
		end
	end

	def new
		@user = current_user
		@animation = Animation.new
	end

	def edit
		@user = current_user
		@animation = Animation.find(params[:id])
	end

	def show
		@animation = Animation.find(params[:id])
	end

	def create
		@user = current_user
		@animation = @user.animations.create(animation_params)

		if @animation.save
			redirect_to new_user_animation_slide_path(@user, @animation)
		else
			render 'new'
		end
	end

	def update
		@user = current_user
		@animation = Animation.find(params[:id])

		if @animation.update(animation_params)
			redirect_to new_user_animation_animation_slide_path(@user,@animation)
		else
			render 'edit'
		end
	end

	def destroy
		@animation = Animation.find(params[:id])
		@animation.destroy

		redirect_to user_path(current_user)
	end

	private

	def animation_params
		params.require(:animation).permit(:title)
	end
end
