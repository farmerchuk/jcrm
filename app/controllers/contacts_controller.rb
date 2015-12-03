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
    @contact = Contact.find(params[:id])
    @tab = params[:tab]
    @record_type = "contact"
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

  private

  def contact_params
    params.require(:contact).permit!
  end
end
