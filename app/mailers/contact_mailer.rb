class ContactMailer < ApplicationMailer

  def contact_mail(contact)
    @contact = contact
    mail(to: ENV['MYADDRESS'] ,
         subject: " お問い合わせを受け付けました!")
  end
  
  def contact_mail_to_customer(contact)
    @contact = contact
    mail(to: contact.email,
         subject: " お問い合わせありがとうございます!")
  end
  
end