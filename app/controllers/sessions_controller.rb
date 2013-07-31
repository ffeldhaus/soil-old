class SessionsController < ApplicationController
  skip_before_filter :require_login

  def create
    player = Player.find_by_name(params[:name])
    supervisor = Supervisor.find_by_name(params[:name])
    admin = Admin.find_by_name(params[:name])
    if player && player.authenticate(params[:password])
      session[:player_id] = player.id
      puts "Player #{session[:player_id]}"
      redirect_to root_url
    elsif supervisor && supervisor.authenticate(params[:password])
      session[:supervisor_id] = supervisor.id
      puts "Supervisor #{session[:supervisor_id]}"
      redirect_to games_path
    elsif admin && admin.authenticate(params[:password])
      session[:admin_id] = admin.id
      puts "Admin #{session[:admin_id]}"
      redirect_to admin_path
    else
      flash.now.alert = "Ungültiger Benutzername oder falsches Passwort"
      render "new"
    end
  end

  def destroy
    session[:player_id] = session[:supervisor_id] = session[:admin_id] = nil
    redirect_to root_url, :notice => "Abgemeldet!"
  end

end
