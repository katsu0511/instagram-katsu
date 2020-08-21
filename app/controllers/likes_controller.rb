class LikesController < ApplicationController

  def show
    post = Post.find(params[:post_id])
    like_status = current_user.has_liked?(post)
    render json: { hasLiked: like_status }
  end

  def create
    post = Post.find(params[:post_id])
    post.likes.create!(user_id: current_user.id)
    redirect_to root_path
  end

  def destroy
    post = Post.find(params[:post_id])
    like = post.likes.find_by!(user_id: current_user.id)
    like.destroy!
    redirect_to root_path
  end
end
