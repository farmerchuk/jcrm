class QuotesController < ApplicationController
  def new
    @quote = Quote.new
    @opportunity_id = params[:opportunity_id]
  end

  def create
    @quote = Quote.new(quote_params)
    #@opportunity_id = session[:active_record][:id].to_i
    @opportunity_id = params[:opportunity_id]
    @quote.user_id = session[:user_id]
    @quote.opportunity_id = @opportunity_id

    if @quote.save
      flash[:notice] = "Quote successfully created!"
      redirect_to Opportunity.find(@opportunity_id)
    else
      render :new
    end
  end

  def show
    @quote = Quote.find(params[:id])
  end

  private

  def quote_params
    params.require(:quote).permit!
  end
end
