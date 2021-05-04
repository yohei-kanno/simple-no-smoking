class NoSmokingUserProfilesController < ApplicationController
  
  before_action :set_user, only: %i[ new create show edit index]
  
  before_action :set_no_smoking_user, only: %i[ edit update ]
  
  def index; end
  
  def new
    @no_smoking_user_profile = NoSmokingUserProfile.new
  end
  
  def create
    @no_smoking_user_profile = NoSmokingUserProfile.new(no_smoking_profile_params)
    if @no_smoking_user_profile.save
      redirect_to user_no_smoking_user_profile_path
    else
      render :new
    end
  end
    
  def show; end
  
  def edit;end
  
  def update
    updated_profile = @no_smoking_user_profile.update(no_smoking_user_profile_params)
    binding.pry
    if updated_profile
      redirect_to user_no_smoking_user_profile_path
    else
      render :edit
    end
  end
  
  private
  
  
  def no_smoking_profile_params
    params.permit(:user_id, :tabaco_price, :smoking_pace, :hourly_wage)
  end
  
  def no_smoking_user_profile_params
    params.require(:no_smoking_user_profile).permit(:user_id, :tabaco_price, :smoking_pace, :hourly_wage)
  end
  
  
  def set_user
    @user = User.find(params[:user_id])
  end

  def set_no_smoking_user
    @no_smoking_user_profile = NoSmokingUserProfile.find(params[:user_id])
  end
end
