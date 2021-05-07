class SessionsController < ApplicationController
  skip_before_action :require_login
  
  def new; end
  
  def create
    if @user = login(params[:email], params[:password])
      if @user.no_smoking_user_profile
        redirect_back_or_to(user_no_smoking_user_profile_path(@user.id))
      else
        redirect_back_or_to(new_user_no_smoking_user_profile_path(@user.id))
      end
    else
      flash[:alert] = 'ログイン失敗'
      render :new
    end
  end
        
  
  def destroy
    logout
    redirect_to(root_url, notice: 'ログアウトしました')
  end
  
  
  private
  
  def user_session_params
    params.permit(:email, :password)
  end
end
