class AnswerMailer < ApplicationMailer
  
  def answer_mail(contact)
    @contact = contact
    mail(to: ENV['MYADDRESS'] ,
         subject: "お問い合わせを送信しました。")
  end
  
  def answer_mail_to_customer(contact)
    @contact = contact
    mail(to: @contact.email ,
         subject: "お問い合わせの回答になります。")
  end
  
end
