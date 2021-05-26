class UsersController < ApplicationController
  skip_before_action :require_login, only: %i[ new create activate]
  before_action :set_user, only: %i[ edit update destroy ]

  def index
    redirect_to new_user_path
  end
  
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:nsmysuccess] = t(".send_mail")
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
        flash[:nsmysuccess] = t(".success_update")
      else
        flash.now[:nsmyalert] = t(".failed_update")
        render :edit
      end
    elsif current_user.reduction_user_profile
      if current_user.reduction_user_profile && current_user.update(user_params)
        redirect_to user_reduction_user_profile_path(current_user.id)
        flash[:remysuccess] = t(".success_update")
       else
        flash.now[:remyalert] = t(".failed_update")
        render :edit  
       end
    end
  end
      
      
  
  def destroy
    @user.destroy
    flash[:nsmysuccess] = t(".success_destroy")
    redirect_to root_url
  end
  
  def activate
    if (@user = User.load_from_activation_token(params[:id]))
      @user.activate!
      flash[:nsmysuccess] = t(".success_activate")
      redirect_to root_path
    else
      not_authenticated
    end
  end
  
  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :birth_date, "利用規約")
  end
  
  def set_user
    @user = User.find(params[:id])
  end
end
