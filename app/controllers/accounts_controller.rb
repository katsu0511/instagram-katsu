class AccountsController < ApplicationController
  before_action :forbid_logout_user

  def show
    @user = User.find(params[:id])
  end
end
