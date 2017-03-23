class ContactsController < ApplicationController

  def index
    @contacts = Contact.all
    render "index.html.erb"
  end

  def show
    contact_id = params[:id]
    @contact = Contact.find_by(id: contact_id)
    render "show.html.erb"
  end

  def new
    render "new.html.erb"
  end

  def create
    contact = Contact.new(
    first_name: params[:form_first_name],
    middle_name: params[:form_middle_name],
    last_name: params[:form_last_name],
    email: params[:form_email],
    phone_number: params[:form_phone_number],
    bio: params[:form_bio],
    user_id: current_user.id)
    contact.save
    flash[:success] = "Recipe Created, Good on ya mate"
    redirect_to "/contacts/#{contact.id}" 
  end

  def edit
    contact_id = params[:id]
    @contact = Contact.find_by(id: contact_id)
    render "edit.html.erb"
  end

  def update
    contact_id = params[:id]
    @contact = Contact.find_by(id: contact_id)
    @contact.first_name = params[:form_first_name]
    @contact.last_name = params[:form_last_name]
    @contact.middle_name = params[:form_middle_name]
    @contact.email = params[:form_email]
    @contact.phone_number = params[:form_phone_number]
    @contact.bio = params[:form_bio]
    @contact.save
    flash[:success] = "Contact updated mate"
    redirect_to "/contacts/#{@contact.id}"
  end

  def destroy
    contact_id = params[:id]
    @contact = Contact.find_by(id: contact_id)
    @contact.destroy
    flash[:danger] = "Contact Destroyed Mate"
    redirect_to "/contacts" 
  end

end