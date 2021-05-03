class UsersController < ApplicationController
  # skip_before_action :require_login, only: [:new, :create]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to mode_select_users_path
    else
      render :new
    end
  end
  
  def mode_select
    
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_comfirmation, :birth_date)
  end
end