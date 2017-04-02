class ContactsController < ApplicationController

  def index
    if current_user
      @contacts = current_user.contacts #--doesnt work --maybe because in an if?
      # @contacts = Contact.where(user_id: current_user.id) 
     # @contacts = Contact.all
      render "index.html.erb"
  else
    redirect_to "/login"
    end
  end

  def show
    if current_user
      contact_id = params[:id]
      @contact = Contact.find_by(id: contact_id)
      render "show.html.erb"
    else
      redirect_to "/login"
    end
  end

  def new
    if current_user
      render "new.html.erb"
    else
      redirect_to "/login"
    end
  end

  def create
    if current_user 
      contact = Contact.new(
      first_name: params[:form_first_name],
      middle_name: params[:form_middle_name],
      last_name: params[:form_last_name],
      email: params[:form_email],
      phone_number: params[:form_phone_number],
      bio: params[:form_bio],
      user_id: current_user.id)
      contact.save
      flash[:success] = "Contact Created, Good on ya mate"
      redirect_to "/contacts/#{contact.id}" 
    else
      redirect_to "/login"
    end
  end

  def edit
    contact_id = params[:id]
    @contact = Contact.find_by(id: contact_id)
    render "edit.html.erb"
  end

  def update
    contact_id = params[:id]
    @contact = Contact.find_by(id: contact_id)
    if @contact.update(
    first_name: params[:form_first_name],
    last_name: params[:form_last_name],
    middle_name: params[:form_middle_name],
    email: params[:form_email],
    phone_number: params[:form_phone_number],
    bio: params[:form_bio],
    )
      flash[:success] = "Contact updated mate"
      redirect_to "/contacts/#{@contact.id}"
  else
    flash[:warning] = "something went wrong"
    render "edit.html.erb"
    end
  end

  def destroy
    contact_id = params[:id]
    @contact = Contact.find_by(id: contact_id)
    @contact.destroy
    flash[:danger] = "Contact Destroyed Mate"
    redirect_to "/contacts" 
  end

end