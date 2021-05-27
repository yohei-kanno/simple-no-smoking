class Admin::AnswersController < ApplicationController
  
  def index
    redirect_to admin_contacts_path
  end
  
  def new
    @answer = Answer.new
    @contact = Contact.find(params[:contact_id])
  end
  
  def create
    @contact = Contact.find(params[:contact_id])
    @answer = @contact.answers.build(answer_params)
    if @answer.save
      @contact.answered = "answered"
      @contact.save
      AnswerMailer.answer_mail(@contact).deliver_now
      AnswerMailer.answer_mail_to_customer(@contact).deliver_now
      flash[:nsmysuccess] = "回答を送信しました"
      redirect_to admin_contacts_path
    else
      flash.now[:nsmyalert] = "回答を入力して下さい"
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
