class ModesController < ApplicationController

  def new
    @mode = Mode.new
  end
  
  def no_smoking
    mode = current_user.build_mode
    mode.save if mode.mode = 0
    if !current_user
      flash[:nsmysuccess] = "ログインして下さい"
      redirect_to login_url
    else
      flash[:nsmysuccess] = "ログインしました！"
      redirect_to new_user_no_smoking_user_profile_path
    end
  end
  
  def reduction
    mode = current_user.build_mode
    mode.save! if mode.mode = 1
    if !current_user
      flash[:nsmysuccess] = "ログインして下さい"
      redirect_to login_url
    else
      flash[:remysuccess] = "ログインしました！"
      redirect_to new_user_reduction_user_profile_path
    end
  end
end
