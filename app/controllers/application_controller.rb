class ApplicationController < ActionController::Base
  before_action :require_login
  
  protected
  
    def not_authenticated
      flash.now[:myalert] = "権限がありません"
      redirect_to login_url
    end
end
