class NoSmokingUserProfilesController < ApplicationController
  before_action :set_no_smoking_user, only: %i[ show edit update ]
  
  layout 'no_smoking'
  
  def new
    if current_user.no_smoking_user_profile
      redirect_to user_no_smoking_user_profile_path
      flash[:nsmyalert] = t(".please_edit")
    else
      @no_smoking_user_profile = current_user.build_no_smoking_user_profile
    end
  end
  
  def create
    @no_smoking_user_profile = current_user.build_no_smoking_user_profile(no_smoking_profile_params)
    if @no_smoking_user_profile.save
      flash[:nsmysuccess] = t(".success_created")
      redirect_to user_no_smoking_user_profile_path
    else
      flash.now[:nsmyalert] = t(".failed_created")
      render :new
    end
  end
    
  def show; end
  
  def edit; end
  
  def update
    if @no_smoking_user_profile.update(no_smoking_profile_params)
      flash[:nsmysuccess] = t(".success_updated")
      redirect_to user_no_smoking_user_profile_path
    else
      flash.now[:nsmyalert] = t(".failed_updated")
      render :edit
    end
  end
  
  
  def destroy
    current_user.no_smoking_user_profile.destroy!
    flash[:nsmysuccess] = t(".select_mode")
    redirect_to new_user_modes_path(current_user.id)
  end
  
  
  private
  
  def no_smoking_profile_params
    params.require(:no_smoking_user_profile).permit(:user_id, :start_date,:tabaco_price, :smoking_pace, :hourly_wage)
  end
  
  def set_no_smoking_user
    @no_smoking_user_profile = current_user.no_smoking_user_profile
  end
end
