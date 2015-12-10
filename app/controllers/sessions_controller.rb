class SessionsController < ApplicationController
  def new; end

  def create
    @user = User.find_by(email: params[:email_address])

    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      flash[:notice] = "You've successfully logged in!"
      redirect_to root_path
    else
      flash.now[:danger] = "Invalid email or password. Please try again!"
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end
end
