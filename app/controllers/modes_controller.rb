class ModesController < ApplicationController
  
  skip_before_action :require_login
  before_action :set_user
  
  def new
    @mode = Mode.new
  end
  
  def edit
  end
  
  
  def no_smoking
    @mode = @user.build_mode
    @mode.mode = 0
    @mode.save!
    redirect_to login_url
    binding.pry
  end
  
  private
  
  def set_user
    @user = User.find_by(id: params[:user_id])
  end
  
end
