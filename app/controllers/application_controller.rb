class ApplicationController < ActionController::Base
  before_action :require_login
  
  def set_mode
    redirect_to new_user_modes_path(current_user.id) if !current_user.mode
  end
  
  protected
  
    def not_authenticated
      redirect_to login_url
    end
end
