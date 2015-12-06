class ContactsController < ApplicationController
  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)

    if @contact.save
      flash[:notice] = "Contact successfully created!"
      redirect_to contact_path(@contact)
    else
      render :new
    end
  end

  def show
    session[:active_record] = { type: Contact, id: params[:id] }
    @contact = Contact.find(params[:id])
    @tab = params[:tab]
    @accounts = @contact.accounts
    @opportunities = @contact.opportunities
    @notes = @contact.notes
  end

  def update
    @contact = Contact.find(params[:id])

    if @contact.update(contact_params)
      flash[:notice] = "Contact successfully updated!"
      redirect_to contact_path(@contact)
    else
      render :show
    end
  end

  def link
    @contact = Contact.find(params[:id])
    @current_record = session[:active_record][:type].find(session[:active_record][:id])

    if @current_record.contacts.include?(@contact)
      flash[:danger] = "'#{@current_record.search_display_name}' is already linked to '#{@contact.search_display_name}'"
      redirect_to @current_record
    else
      @current_record.contacts << @contact
      flash[:notice] = "'#{@current_record.search_display_name}' successfully linked to '#{@contact.search_display_name}'"
      redirect_to @current_record
    end
  end

  private

  def contact_params
    params.require(:contact).permit!
  end
end
