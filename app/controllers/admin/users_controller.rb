class Admin::UsersController < ApplicationController
  
  before_action :admin_user
  
  
  def index
    @users = User.all.order(created_at: :desc)
  end
  
  def show
    @user = User.find(params[:id])
  end
  
  private
    def admin_user
      raise unless current_user.admin?
    end
end
