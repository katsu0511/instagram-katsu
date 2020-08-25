class FollowsController < ApplicationController
  before_action :forbid_logout_user

  def show
    user = User.find(params[:account_id])
    follow_status = current_user.has_followed?(user)
    render json: { hasFollowed: follow_status }
  end

  def create
    current_user.follow!(params[:account_id])

    render json: { status: 'ok' }
  end

  def destroy
    current_user.unfollow!(params[:account_id])

    render json: { status: 'ok' }
  end
end
