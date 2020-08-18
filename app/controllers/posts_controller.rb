class PostsController < ApplicationController
  def new
    @post = current_user.posts.build
  end

  def create
    @post = current_user.posts.build(posts_params)
    if @post.save
      redirect_to root_path, notice: 'Successfully posted!'
    else
      flash.now[:error] = 'Failed to post'
      render :new
    end
  end

  private
  def posts_params
    params.require(:posts).permit(
      :photos,
      :content
    )
  end
end
