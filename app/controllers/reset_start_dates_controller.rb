class ResetStartDatesController < ApplicationController
  
  def update
    if current_user.mode.mode === "no_smoking_mode"
      current_user.no_smoking_user_profile.start_date = DateTime.current
      flash[:nsmysuccess] = "データをリセットしました！"
      redirect_to user_no_smoking_user_profile_path(current_user.id) if current_user.no_smoking_user_profile.save!
      
    elsif current_user.mode.mode === "reduction_mode"
      current_user.reduction_user_profile.start_date = DateTime.current
      flash[:remysuccess] = "データをリセットしました！"
      current_user.reduction_user_profile.stocks.destroy_all
      redirect_to user_reduction_user_profile_path(current_user.id) if current_user.reduction_user_profile.save! 
    end
  end
end
