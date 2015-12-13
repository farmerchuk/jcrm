class OpportunitiesController < ApplicationController
  before_action :require_user
  before_action :require_same_user_or_admin, only: [:update]

  def new
    @opportunity = Opportunity.new
  end

  def create
    @opportunity = Opportunity.new(opportunity_params)
    @opportunity.users << current_user

    if @opportunity.save
      flash[:notice] = "Opportunity successfully created!"
      redirect_to opportunity_path(@opportunity)
    else
      render :new
    end
  end

  def show
    @record_type = Opportunity
    @record_id = params[:id]
    @opportunity = Opportunity.find(params[:id])
    @tab = params[:tab]
    @accounts = @opportunity.accounts
    @contacts = @opportunity.contacts
    @notes = @opportunity.notes
    @users = @opportunity.users
    @quotes = @opportunity.quotes
  end

  def update
    @opportunity = Opportunity.find(params[:id])

    if @opportunity.update(opportunity_params)
      flash[:notice] = "Opportunity successfully updated"
      redirect_to opportunity_path(@opportunity)
    else
      render :new
    end
  end

  def link
    @opportunity = Opportunity.find(params[:id])
    @current_record = params[:record_type].constantize.find(params[:record_id])

    if @current_record.opportunities.include?(@opportunity)
      flash[:danger] = "'#{@current_record.search_display_name}' is already linked to '#{@opportunity.search_display_name}'"
      redirect_to @current_record
    else
      @current_record.opportunities << @opportunity
      flash[:notice] = "'#{@current_record.search_display_name}' successfully linked to '#{@opportunity.search_display_name}'"
      redirect_to @current_record
    end
  end

  private

  def opportunity_params
    params.require(:opportunity).permit!
  end

  def require_same_user_or_admin
    @opportunity = Opportunity.find(params[:id])

    begin
      flash[:danger] = "You do not have access to that action!"
      redirect_to opportunity_path(@opportunity)
    end unless @opportunity.users.include?(current_user) || current_user.is_admin?
  end
end
