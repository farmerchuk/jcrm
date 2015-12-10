class AccountsController < ApplicationController
  before_action :require_user

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
    session[:active_record] = { type: Account, id: params[:id] }
    @account = Account.find(params[:id])
    @tab = params[:tab]
    @contacts = @account.contacts
    @opportunities = @account.opportunities
    @notes = @account.notes
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

  def link
    @account = Account.find(params[:id])
    @current_record = session[:active_record][:type].find(session[:active_record][:id])

    if @current_record.accounts.include?(@account)
      flash[:danger] = "'#{@current_record.search_display_name}' is already linked to '#{@account.search_display_name}'"
      redirect_to @current_record
    else
      @current_record.accounts << @account
      flash[:notice] = "'#{@current_record.search_display_name}' successfully linked to '#{@account.search_display_name}'"
      redirect_to @current_record
    end
  end

  private

  def account_params
    params.require(:account).permit!
  end

end
