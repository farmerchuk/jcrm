class OpportunitiesController < ApplicationController
  def new
    @opportunity = Opportunity.new
  end

  def create
    @opportunity = Opportunity.new(opportunity_params)

    if @opportunity.save
      flash[:notice] = "Opportunity successfully created!"
      redirect_to opportunity_path(@opportunity)
    else
      render :new
    end
  end

  def show
    session[:active_record] = { type: Opportunity, id: params[:id] }
    @opportunity = Opportunity.find(params[:id])
    @tab = params[:tab]
    @accounts = @opportunity.accounts
    @contacts = @opportunity.contacts
    @notes = @opportunity.notes
    @users = @opportunity.users
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
    @current_record = session[:active_record][:type].find(session[:active_record][:id])

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
end
