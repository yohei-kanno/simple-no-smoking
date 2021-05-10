class SessionsController < ApplicationController
  skip_before_action :require_login
  
  def new; end
  
  def create
    if @user = login(params[:email], params[:password])
      if @user.no_smoking_user_profile && (@user.mode.mode === "no_smoking_mode")
        flash[:nsmysuccess] = "ログインしました！"
        redirect_back_or_to(user_no_smoking_user_profile_path(@user.id))
      elsif @user.reduction_user_profile && (@user.mode.mode === "reduction_mode")
        flash[:remysuccess] = "ログインしました！"
        redirect_back_or_to(user_reduction_user_profile_path(@user.id))
        
      elsif !@user.mode
        flash[:nsmysuccess] = "モードを選択して下さい"
        redirect_back_or_to(new_user_modes_path(@user.id))
        
      elsif (@user.mode.mode === "no_smoking_mode") && !@user.no_smoking_user_profile
        flash[:nsmysuccess] = "ログインしました！"
        redirect_back_or_to(new_user_no_smoking_user_profile_path(@user.id))
        
      elsif (@user.mode.mode === "reduction_mode") && !@user.reduction_user_profile
        flash[:remysuccess] = "ログインしました！"
        redirect_back_or_to(new_user_reduction_user_profile_path(@user.id))
      end
    else
      flash.now[:nsmyalert] = 'ログイン出来ませんでした'
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
