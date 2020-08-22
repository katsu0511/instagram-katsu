class CommentsController < ApplicationController

  def new
    post = Post.find(params[:post_id])
    @comment = post.comments.build
  end

  def create
    post = Post.find(params[:post_id])
    @comment = post.comments.build(comment_params)
    @comment.user_id = current_user.id

    if @comment.save
      redirect_to post_comments_path(post), notice: 'Successfully posted a comment!'
    else
      flash.now[:error] = 'Failed to post'
      render :new
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:content)
  end
end
