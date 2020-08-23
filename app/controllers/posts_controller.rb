class PostsController < ApplicationController
  before_action :forbid_logout_user

  def show
    @post = Post.find_by(id: params[:id])
  end

  def new
    @post = current_user.posts.build
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      redirect_to root_path, notice: 'Successfully posted!'
    else
      flash.now[:error] = 'Failed to post'
      render :new
    end
  end

  private
  def post_params
    params.require(:post).permit(
      :content,
      {photos: []}
    )
  end
end
