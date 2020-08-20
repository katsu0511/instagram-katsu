class ProfilesController < ApplicationController
  before_action :forbid_logout_user

  def show
    raise StandardError
  end

  def edit
    @profile = current_user.prepare_profile
  end

  def update
    @profile = current_user.prepare_profile
    @profile.assign_attributes(profile_params)
    if @profile.save
      redirect_to profile_path, notice: 'Successfully updated profile!'
    else
      flash.now[:error] = 'Failed to update profile'
      render :edit
    end
  end

  private
  def profile_params
    params.require(:profile).permit(:icon)
  end
end
