class ResetStartDatesController < ApplicationController
  
  def update
    if current_user.mode.mode === "no_smoking_mode"
      current_user.no_smoking_user_profile.start_date = DateTime.current
      flash[:nsmysuccess] = t(".reset_data")
      redirect_to user_no_smoking_user_profile_path(current_user.id) if current_user.no_smoking_user_profile.save!
      
    elsif current_user.mode.mode === "reduction_mode"
      current_user.reduction_user_profile.start_date = DateTime.current
      current_user.reduction_user_profile.smoking_count = 0

      flash[:remysuccess] = t(".reset_data")
      current_user.reduction_user_profile.stocks.destroy_all
      redirect_to user_reduction_user_profile_path(current_user.id) if current_user.reduction_user_profile.save! 
    end
  end
end
