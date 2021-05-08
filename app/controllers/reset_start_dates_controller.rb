class ResetStartDatesController < ApplicationController
  
  before_action :set_user,only: %i[ update ]
  
  def update
    if current_user.mode.mode === "no_smoking_mode"
      current_user.no_smoking_user_profile.start_date = DateTime.current
      
      redirect_to user_no_smoking_user_profile_path(current_user.id) if current_user.no_smoking_user_profile.save!
      
    elsif current_user.mode.mode === "reduction_mode"
      current_user.reduction_user_profile.start_date = DateTime.current
      redirect_to user_reduction_user_profile_path(current_user.id) if current_user.reduction_user_profile.save! 
    end
  end
  
  private
  
  def set_user
    current_user
  end
end
