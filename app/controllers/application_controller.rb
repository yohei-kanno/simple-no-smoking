class ApplicationController < ActionController::Base
  before_action :require_login
  
  rescue_from ActionController::RoutingError, with: :render_404
  
  def render_404(exception = nil)
    redirect_to root_path
  end
  
  protected
  
    def not_authenticated
      flash.now[:myalert] = "権限がありません"
      redirect_to main_app.login_url
    end
end
