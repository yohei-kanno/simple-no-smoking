class AnswerMailer < ApplicationMailer
  
  def answer_mail(contact)
    @contact = contact
    mail(to: ENV['MYADDRESS'] ,
         subject: "回答しました")
  end
  
  def answer_mail_to_customer(contact)
    @contact = contact
    mail(to: @contact.email ,
         subject: "回答しました")
  end
  
end
