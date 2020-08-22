class CommentsController < ApplicationController
  def index
    post = Post.find(params[:post_id])
    @comments = post.comments.all
  end

  def show
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
