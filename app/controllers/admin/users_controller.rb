class Admin::UsersController < ApplicationController
  
  before_action :admin_user
  
  
  def index
    @users = User.all.order(created_at: :desc)
  end
  
  def show
    @user = User.find(params[:id])
  end
  
  def edit
    @user = User.find(params[:id])
  end
  
  def destroy
    @user = User.find(params[:id])
    @user.destroy!
    flash[:nsmysuccess] = "アカウントを削除しました"
    redirect_to admin_users_path
  end
  
  
  private
    def admin_user
      raise unless current_user.admin?
    end
    
    
end
