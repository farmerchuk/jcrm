class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user, :logged_in?, :require_admin, :opportunity_value

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in?
    !!current_user
  end

  def require_user
    access_denied if !logged_in?
  end

  def require_admin
    access_denied unless logged_in? && current_user.role.type == "Admin"
  end

  def access_denied
    flash[:danger] = "You are not logged in!"
    redirect_to root_path
  end

  def opportunity_value(opp)
    if opp.quotes.size > 0 && opp.quotes.find_by(primary: true)
      opp.quotes.find_by(primary: true).value
    else
      0
    end
  end
end
