class UsersController < ApplicationController
  before_action :require_user, except: [:new, :create]
  before_action :require_same_user_or_admin, only: [:update]
  before_action :require_admin, only: [:unlink]

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    @user.role = Role.find_by(name: "Basic")

    if @user.save
      flash[:notice] = "Account created successfully!"
      session[:user_id] = @user.id
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @record_type = User
    @record_id = params[:id]
    @tab = params[:tab]
    @user = User.find(params[:id])
    @opportunities = @user.opportunities
    @notes = @user.notes
  end

  def update
    @user = User.find(params[:id])
    @opportunities = @user.opportunities
    @notes = @user.notes

    if @user.update(user_params)
      flash[:notice] = "Account successfully updated!"
      redirect_to user_path(@user)
    else
      render :show
    end
  end

  def link
    @user = User.find(params[:id])
    @current_record = params[:record_type].constantize.find(params[:record_id])

    if @current_record.users.include?(@user)
      flash[:danger] = "'#{@current_record.search_display_name}' is already linked to '#{@user.search_display_name}'"
      redirect_to @current_record
    else
      @current_record.users << @user
      flash[:notice] = "'#{@current_record.search_display_name}' successfully linked to '#{@user.search_display_name}'"
      redirect_to @current_record
    end
  end

  def unlink
    @user = User.find(params[:id])
    @current_record = params[:record_type].constantize.find(params[:record_id])
    @current_record.users.delete(@user)
    flash[:notice] = "'#{@user.search_display_name}' successfully unlinked from '#{@current_record.search_display_name}'"
    redirect_to @current_record
  end

  private

  def user_params
    params.require(:user).permit!
  end

end
