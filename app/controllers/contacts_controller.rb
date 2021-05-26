class ContactsController < ApplicationController
  skip_before_action :require_login
   
  def new
    if current_user
      if current_user.no_smoking_user_profile
        render :layout => 'no_smoking'
      elsif current_user.reduction_user_profile
        render :layout => 'reduction'
      end
    end
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)
    @user = User.find_by(email: params[:contact][:email])
    if @contact.save 
      ContactMailer.contact_mail(@contact).deliver
      ContactMailer.contact_mail_to_customer(@contact).deliver
      if current_user && current_user.no_smoking_user_profile
        flash[:nsmysuccess] = "お問い合わせを受け付けました"
        redirect_to "/users/#{current_user.id}/no_smoking_user_profile"
        
      elsif current_user && current_user.reduction_user_profile
        flash[:remysuccess] = "お問い合わせを受け付けました"
        redirect_to "/users/#{current_user.id}/reduction_user_profile"
        
      else
        flash[:nsmysuccess] = "お問い合わせを受け付けました"
        redirect_to root_path
      end
    else
      flash.now[:nsmyalert] = "必要事項を入力して下さい"
      render :new
    end
  end
  
  private
    def contact_params
      params.require(:contact).permit(:name, :email, :content, :mode)
    end
end
