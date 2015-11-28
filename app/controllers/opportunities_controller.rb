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
    @opportunity = Opportunity.find(params[:id])
    @tab = params[:tab]
    @record_type = "opportunity"
    @accounts = Account.all
    @contacts = Contact.all
    @notes = Note.all
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

  private

  def opportunity_params
    params.require(:opportunity).permit!
  end
end
