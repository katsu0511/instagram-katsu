class TimelinesController < ApplicationController
  before_action :forbid_logout_user

  def show
    @posts = Post.all
  end
end
