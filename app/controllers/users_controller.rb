class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    @user.role = Role.find_by(role: "Basic")

    if @user.save
      flash[:notice] = "Account created successfully!"
      redirect_to user_path(@user)
    else
      render :new
    end
  end

  def show
    session[:active_record] = { type: User, id: params[:id] }
    @user = User.find(params[:id])
    @opportunities = @user.opportunities
  end

  def update
    @user = User.find(params[:id])

    if @user.update(user_params)
      flash[:notice] = "Account successfully updated!"
      redirect_to user_path(@user)
    else
      render :show
    end
  end

  def link
    @user = User.find(params[:id])
    @current_record = session[:active_record][:type].find(session[:active_record][:id])

    if @current_record.users.include?(@user)
      flash[:danger] = "'#{@current_record.search_display_name}' is already linked to '#{@user.search_display_name}'"
      redirect_to @current_record
    else
      @current_record.users << @user
      flash[:notice] = "'#{@current_record.search_display_name}' successfully linked to '#{@user.search_display_name}'"
      redirect_to @current_record
    end
  end

  private

  def user_params
    params.require(:user).permit!
  end
end
