class AccountsController < ApplicationController
  def new
    @account = Account.new
  end

  def create
    @account = Account.new(account_params)

    if @account.save
      flash[:notice] = "Account successfully created!"
      redirect_to account_path(@account)
    else
      render :new
    end
  end

  def show
    @account = Account.find(params[:id])
    @tab = params[:tab]
    @record_type = "account"
    @contacts = Contact.all   # Change the to related records
    @opportunities = Opportunity.all
    @notes = Note.all
  end

  def update
    @account = Account.find(params[:id])

    if @account.update(account_params)
      flash[:notice] = "Account successfully updated!"
      redirect_to account_path(@account)
    else
      render :show
    end
  end

  private

  def account_params
    params.require(:account).permit!
  end

end
