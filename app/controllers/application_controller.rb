class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :require_login

  def default_serializer_options
    {root: false}
  end

  private

  def current_user
    user ||= Admin.find_by_id(session[:admin_id]) if session[:admin_id]
    user ||= Supervisor.find_by_id(session[:supervisor_id]) if session[:supervisor_id]
    user ||= Player.find_by_id(session[:player_id]) if session[:player_id]
    user
  end

  def player?
    current_user.kind_of? Player
  end

  def supervisor?
    current_user.kind_of? Supervisor
  end

  def admin?
    current_user.kind_of? Admin
  end

  helper_method :current_user, :player?, :supervisor?, :admin?

  def require_login
    redirect_to welcome_url if current_user.nil?
  end
end
