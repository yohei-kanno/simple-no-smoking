class SessionsController < ApplicationController
  skip_before_action :require_login
  
  def new; end
  
  def create
    if @user = login(params[:email], params[:password])
      if @user.no_smoking_user_profile && (@user.mode.mode === "no_smoking_mode")
        flash[:nsmysuccess] = t(".success_logined")
        redirect_to(user_no_smoking_user_profile_path(@user.id))
        
      elsif @user.reduction_user_profile && (@user.mode.mode === "reduction_mode")
        flash[:remysuccess] = t(".success_logined")
        redirect_to(user_reduction_user_profile_path(@user.id))
        
      elsif !@user.mode
        flash[:nsmysuccess] = t(".select_mode")
        redirect_to(new_user_modes_path(@user.id))
        
      elsif (@user.mode.mode === "no_smoking_mode") && !@user.no_smoking_user_profile
        flash[:nsmysuccess] = t(".success_logined")
        redirect_to(new_user_no_smoking_user_profile_path(@user.id))
        
      elsif (@user.mode.mode === "reduction_mode") && !@user.reduction_user_profile
        flash[:remysuccess] = t(".success_logined")
        redirect_to(new_user_reduction_user_profile_path(@user.id))
      end
    else
      flash.now[:nsmyalert] = t(".failed_logined")
      render :new
    end
  end
        
  def destroy
    logout
    flash[:nsmysuccess] = "ログアウトしました"
    redirect_to root_url
  end
  
  
  private
  
  def user_session_params
    params.permit(:email, :password)
  end
  
end
