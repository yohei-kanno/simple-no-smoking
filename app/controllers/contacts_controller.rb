class ContactsController < ApplicationController
  skip_before_action :require_login
   
  def index
    redirect_to new_contact_path
  end
  
  def confirm_new
    @contact = Contact.new(contact_params)
    if !@contact.valid?
      render :new
      return
    end
    
    if current_user && current_user.no_smoking_user_profile
      render :layout => 'no_smoking'
    elsif current_user && current_user.reduction_user_profile
      render :layout => 'reduction'
    end
  end
  
  def new
    @contact = Contact.new
    if current_user
      if current_user.no_smoking_user_profile
        render :layout => 'no_smoking'
      elsif current_user.reduction_user_profile
        render :layout => 'reduction'
      end
    end
  end

  def create
    @contact = Contact.new(contact_params)
    if params[:back].present?
      render :new
      return
    end

    if @contact.save
      ContactMailer.contact_mail(@contact).deliver_now
      ContactMailer.contact_mail_to_customer(@contact).deliver_now
      if current_user && current_user.no_smoking_user_profile
        flash[:nsmysuccess] = t(".contact_create")
        redirect_to "/users/#{current_user.id}/no_smoking_user_profile"
        
      elsif current_user && current_user.reduction_user_profile
        flash[:remysuccess] = t(".contact_create")
        redirect_to "/users/#{current_user.id}/reduction_user_profile"
        
      else
        flash[:nsmysuccess] = t(".contact_create")
        redirect_to root_path
      end
    else
      flash.now[:nsmyalert] = t(".contact_failed_create")
      render :new
    end
  end
  
  private
    def contact_params
      params.require(:contact).permit(:name, :email, :content, :mode)
    end
end
