class UsersController < ApplicationController
  skip_before_action :require_login, only: %i[ new create]
  before_action :set_user, only: %i[ edit update destroy ]

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
  
  def edit
    if current_user.no_smoking_user_profile
      render :layout => 'no_smoking'
    else
      render :layout => 'reduction'
    end
  end
  
  
  def update
    if current_user.no_smoking_user_profile
      if current_user.update(user_params)
        redirect_to user_no_smoking_user_profile_path(current_user.id)
        flash[:nsmysuccess] = "更新しました"
      else
        flash.now[:nsmyalert] = "更新出来ませんでした"
        render :edit
      end
    elsif current_user.reduction_user_profile
      if current_user.reduction_user_profile && current_user.update(user_params)
        redirect_to user_reduction_user_profile_path(current_user.id)
        flash[:remysuccess] = "更新しました"
       else
         flash.now[:remyalert] = "更新出来ませんでした"
         render :edit  
       end
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
