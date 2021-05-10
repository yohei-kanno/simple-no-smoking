class UsersController < ApplicationController
  skip_before_action :require_login, only: [:new, :create]
  before_action :set_user, only: %i[ destroy ]
  
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:nsmysuccess] = "登録が完了しました！"
      redirect_to new_user_modes_path(@user.id)
    else
      flash.now[:nsmyalert] = "登録が出来ませんでした"
      render :new
    end
  end

  def destroy
    @user.destroy
    flash[:nsmysuccess] = "アカウントを削除しました！"
    redirect_to root_url
  end
  
  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_comfirmation, :birth_date)
  end
  
  def set_user
    @user = User.find(params[:id])
  end
end
