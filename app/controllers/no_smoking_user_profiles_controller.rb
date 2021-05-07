class NoSmokingUserProfilesController < ApplicationController
  before_action :set_user, only: %i[ new create show edit ]
  before_action :set_no_smoking_user, only: %i[ show edit update ]
  
  
  def new
    @no_smoking_user_profile = current_user.build_no_smoking_user_profile
  end
  
  def create
    @no_smoking_user_profile = current_user.build_no_smoking_user_profile(no_smoking_user_profile_params)
    if @no_smoking_user_profile.save
      redirect_to user_no_smoking_user_profile_path
    else
      render :new
    end
  end
    
  def show; end
  
  def edit; end
  
  def update
    if @no_smoking_user_profile.update(no_smoking_user_profile_params)
      redirect_to user_no_smoking_user_profile_path
    else
      render :edit
    end
  end
    
  
  private
  
  def no_smoking_user_profile_params
    params.require(:no_smoking_user_profile).permit(:user_id, :start_date,:tabaco_price, :smoking_pace, :hourly_wage)
  end
  
  def set_user
    @user = current_user
  end

  def set_no_smoking_user
    @no_smoking_user_profile = current_user.no_smoking_user_profile
  end
end
