class UsersController < ApplicationController
  # skip_before_action :require_login, only: [:new, :create]
  
  before_action :set_user, only: %i[ mode_select ]
  
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to mode_select_user_path(@user.id)
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
  
  def set_user
    @user = User.find(params[:id])
  end
end