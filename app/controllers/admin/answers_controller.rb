class Admin::AnswersController < ApplicationController
  
  def new
    @answer = Answer.new
    @contact = Contact.find(params[:contact_id])
  end
  
  def create
    contact = Contact.find(params[:contact_id])
    @answer = contact.answers.build(answer_params)
    if @answer.save
      contact.answered = "answered"
      contact.save
      AnswerMailer.answer_mail(contact).deliver_now
      AnswerMailer.answer_mail_to_customer(contact).deliver_now
      flash[:mynssuccess] = "回答しました"
      redirect_to admin_contacts_path
    else
      render :new
    end
  end
  
  def show
    @contact = Contact.find(params[:contact_id])
  end
  
  private
  def answer_params
    params.require(:answer).permit(:content)
  end
end
