class CommentsController < ApplicationController
  before_action :require_user
  before_filter :require_permission, only: :destroy

  def require_permission
    if current_user != Comment.find(params[:id]).user
      redirect_to root_path
    end
  end

  def create
    @user = current_user

    if Still.exists?(params[:still_id])
      @still = Still.find(params[:still_id])
      @comment = @still.comments.create(comment_params)
      @comment.user = @user

      if @comment.save
        redirect_to user_still_path(@user, @still)
      else
        redirect_to user_still_path(@user, @still)
      end

    elsif Animation.find(params[:animation_id])
      @animation = Animation.find(params[:animation_id])
      @comment = @animation.comments.create(comment_params)
      @comment.user = @user

      if @animation.save
        redirect_to user_animation_path(@user, @animation)
      else
        redirect_to user_animation_path(@user, @animation)
      end
    end
  end

  def destroy
    @user = current_user
    if Still.exists?(params[:still_id])
      @still = Still.find(params[:still_id])

      @comment = Comment.find(params[:id])
      @comment.destroy

      redirect_to user_still_path(@user, @still)
    elsif Animation.find(params[:animation_id])
      @animation = Animation.find(params[:animation_id])

      @comment = Comment.find(params[:id])
      @comment.destroy

      redirect_to user_animation_path(@user, @animation)
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end

end
