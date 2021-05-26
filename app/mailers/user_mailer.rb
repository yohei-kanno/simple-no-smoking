class UserMailer < ApplicationMailer
 
  
  def reset_password_email(user)
    @user = User.find(user.id)
    @url  = edit_password_reset_url(@user.reset_password_token)
    mail(to: user.email,
         subject: "パスワードリセット申請を受け付けました")
  end
  
  def activation_needed_email(user)
    @user = user
    @url  = activate_user_url(user.activation_token)
    mail(:to => user.email,
     :subject => "SimpleNoSmokingへようこそ！")
  end

  def activation_success_email(user)
    @user = user
    @url  = login_url
    mail(:to => user.email,
         :subject => "アカウントが有効化されました！")
  end
  
end
