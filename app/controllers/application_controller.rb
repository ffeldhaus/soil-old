class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :require_login

  private

  def current_group
    @current_group ||= Group.find(session[:group_id]) if session[:group_id]
  end
  helper_method :current_group

  def require_login
    redirect_to login_url, alert: "Not authorized" if current_group.nil?
  end
end
