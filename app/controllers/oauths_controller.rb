class OauthsController < ApplicationController
  skip_before_action :require_login

  def oauth
    login_at(auth_params[:provider])
  end
  
  def callback
    provider = auth_params[:provider]
    if (@user = login_from(provider))
      redirect_to root_path
      if current_user.no_smoking_user_profile
        flash[:nsmysuccess] = "#{provider.titleize}でログインしました"
      elsif current_user.reduction_user_profile
        flash[:remysuccess] = "#{provider.titleize}でログインしました"
      end
    else
     if  @user = create_from(provider)
        reset_session
        auto_login(@user)
        redirect_to root_path
        flash[:nsmysuccess] = "#{provider.titleize}でログインしました"
      else
        redirect_to root_path
        flash[:nsmyalert] = "#{provider.titleize}でのログインに失敗しました"
      end
    end
  end

  private

  def auth_params
    params.permit(:code, :provider)
  end
end
