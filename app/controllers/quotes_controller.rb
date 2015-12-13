class QuotesController < ApplicationController
  before_action :require_user
  before_action :require_same_user_or_admin, only: [:update]

  def new
    @quote = Quote.new
    @opportunity_id = params[:opportunity_id]
  end

  def create
    @quote = Quote.new(quote_params)
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
    @opportunity_id = params[:opportunity_id]
  end

  def update
    @quote = Quote.find(params[:id])
    @opportunity_id = params[:opportunity_id]

    if @quote.update(quote_params)
      flash[:notice] = "Quote updated successfully!"
      redirect_to Opportunity.find(@opportunity_id)
    else
      render :new
    end
  end

  private

  def quote_params
    params.require(:quote).permit!
  end

  def require_same_user_or_admin
    @quote = Quote.find(params[:id])

    begin
      flash[:danger] = "You do not have access to that action!"
      redirect_to quote_path(@quote)
    end unless @quote.user_id == current_user.id || current_user.is_admin?
  end
end
