class TimelinesController < ApplicationController
  before_action :forbid_logout_user

  def show
    @posts = current_user.posts
  end
end
