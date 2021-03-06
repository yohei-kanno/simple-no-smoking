class ReductionUserProfilesController < ApplicationController
  layout 'reduction'
  
  before_action :set_reduction_user, only: %i[ show edit update destory]
  before_action :should_be_mode
  
  def new
    if current_user.no_smoking_user_profile
      redirect_to user_no_smoking_user_profile_path
      flash[:nsmyalert] = t(".please_select_reduction")
    elsif current_user.reduction_user_profile
      redirect_to user_reduction_user_profile_path
      flash[:remyalert] = t(".please_edit")
    else
      @reduction_user_profile = current_user.build_reduction_user_profile
    end
  end
      
  def create
    @reduction_user_profile = current_user.build_reduction_user_profile(reduction_user_profile_params)
    if @reduction_user_profile.save
      flash[:remysuccess] = t(".success_created")
      redirect_to user_reduction_user_profile_path
    else
      flash.now[:remyalert] = t(".failed_created")
      render :new
    end
  end

  def edit; end
  
  def show
    time = ReductionUserProfile.smoking_in_second(current_user)
    gon.time = time
  end
  
  def update
    if @reduction_user_profile.update(reduction_user_profile_params)
      flash[:remysuccess] = t(".success_updated")
      redirect_to user_reduction_user_profile_path
    else
      flash.now[:remyalert] = t(".failed_updated")
      render :edit
    end
  end
  
  def destroy
    current_user.reduction_user_profile.destroy!
    current_user.mode.destroy!
    flash[:nsmysuccess] = t(".select_mode")
    redirect_to new_user_modes_path(current_user.id)
  end
  
  private
  
  def reduction_user_profile_params
    params.require(:reduction_user_profile).permit(:user_id, :start_date,:tabaco_price, :smoking_pace, :hourly_wage)
  end
  
  def set_reduction_user
    @reduction_user_profile = current_user.reduction_user_profile
  end
  
  def should_be_mode
    if !current_user.mode
      flash[:nsmyalert] = t(".select_mode")
      redirect_to new_user_modes_path(current_user.id)
    end
  end
end
