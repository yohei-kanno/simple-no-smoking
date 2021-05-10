class ModesController < ApplicationController

  def new
    @mode = Mode.new
  end
  
  def no_smoking
    mode = current_user.build_mode
    mode.save if mode.mode = 0
    flash[:nsmysuccess] = "ログインして下さい"
    redirect_to login_url
  end
  
  def reduction
    mode = current_user.build_mode
    mode.save! if mode.mode = 1
    flash[:nsmysuccess] = "ログインして下さい"
    redirect_to login_url
  end
end
