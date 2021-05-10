class ReductionUserProfilesController < ApplicationController
  layout 'reduction'
  
  before_action :set_reduction_user, only: %i[ show edit update destory]
  
  def new
    @reduction_user_profile = current_user.build_reduction_user_profile
  end
  
  def create
    @reduction_user_profile = current_user.build_reduction_user_profile(reduction_user_profile_params)
    if @reduction_user_profile.save
      flash[:remysuccess] = "登録が完了しました！"
      redirect_to user_reduction_user_profile_path
    else
      flash.now[:remyalert] = "登録が出来ませんでした"
      render :new
    end
  end

  def edit; end
  
  def show;end
  
  def update
    if @reduction_user_profile.update(reduction_user_profile_params)
      flash[:remysuccess] = "更新が完了しました！"
      redirect_to user_reduction_user_profile_path
    else
      flash.now[:remyalert] = "更新が出来ませんでした"
      render :edit
    end
  end
  
  def destroy
    current_user.reduction_user_profile.destroy
    flash[:nsmysuccess] = "モードを切り替える事が出来ます"
    redirect_to new_user_modes_path(current_user.id)
  end
  
  private
  
  def reduction_user_profile_params
    params.require(:reduction_user_profile).permit(:user_id, :start_date,:tabaco_price, :smoking_pace, :hourly_wage)
  end
  
  def set_reduction_user
    @reduction_user_profile = current_user.reduction_user_profile
  end
end
