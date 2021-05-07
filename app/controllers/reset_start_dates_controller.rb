class ResetStartDatesController < ApplicationController
  
  before_action :set_user,only: %i[ update ]
  
  def update
    @user.no_smoking_user_profile.start_date = DateTime.current
    redirect_to user_no_smoking_user_profile_path(@user.id) if @user.no_smoking_user_profile.save!
  end
  
  private
  
  def set_user
    @user = User.find(params[:user_id])
  end
end
