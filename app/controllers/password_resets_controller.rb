class PasswordResetsController < ApplicationController
  skip_before_action :require_login

  def new; end

  def create
    @user = User.find_by_email(params[:email])
      if @user
        @user.deliver_reset_password_instructions!
        flash[:nsmysuccess] = "パスワードリセットURLを送信しました"
        redirect_to root_path
      else
        flash[:nsmyalert] = "メールアドレスが正しくありません"
        redirect_to new_password_reset_path
      end
    end
    
  def edit
    @token = params[:id]
    @user = User.load_from_reset_password_token(params[:id])

    if @user.blank?
      not_authenticated
      return
    end
  end
      
  
  def update
    @token = params[:id]
    @user = User.load_from_reset_password_token(params[:id])

    if @user.blank?
      not_authenticated
      return
    end


    @user.password_confirmation= params[:user][:password_confirmation]

    if @user.change_password(params[:user][:password])
      flash[:nsmysuccess] = "パスワードを更新しました"
      redirect_to root_path
    else
      render :edit
    end
  end
end
