class ContactMailer < ApplicationMailer
  default from: "NoSmoking@example.com"
  
  def contact_mail(contact)
    @contact = contact
    mail to:"tkro.812.wkrni@icloud.com",subject: " お問い合わせを受け付けました!"
  end
  
  def contact_mail_to_customer(contact)
    @contact = contact
    mail to: contact.email,subject: " お問い合わせありがとうございます!"
  end
end