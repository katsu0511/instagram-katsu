class ApplicationController < ActionController::Base
  before_action :forbid_logout_user

  private
  def forbid_logout_user
    if !signed_in?
      redirect_to new_user_session_path, notice: 'You need to sign in'
    end
  end
end
