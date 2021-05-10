class UsersController < ApplicationController
  skip_before_action :require_login, only: [:new, :create]
  before_action :set_user, only: %i[ destroy ]
  
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:nsmysuccess] = t(".success_created")
      redirect_to root_url
    else
      flash.now[:nsmyalert] = t(".failed_created")
      render :new
    end
  end

  def destroy
    @user.destroy
    flash[:nsmysuccess] = t(".success_destroy")
    redirect_to root_url
  end
  
  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :birth_date)
  end
  
  def set_user
    @user = User.find(params[:id])
  end
end
