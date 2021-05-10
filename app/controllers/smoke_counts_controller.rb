class SmokeCountsController < ApplicationController
  def update
    if params[:reduction] == t(".one_smoke")
     current_user.reduction_user_profile.smoking_count += 1
    else
      current_user.reduction_user_profile.smoking_count -= 1
    end
    redirect_to user_reduction_user_profile_path(current_user.id) if current_user.reduction_user_profile.save!
  end
end
