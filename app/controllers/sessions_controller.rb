class SessionsController < ApplicationController
  skip_before_filter :require_login

  def new
  end

  def create
    group = Group.find_by_groupname(params[:groupname])
    if group && group.authenticate(params[:password])
      session[:group_id] = group.id
      redirect_to root_url, :notice => "Sie haben sich erfolgreich angemeldet!"
    else
      flash.now.alert = "Ungültiger Gruppenname oder falsches Passwort"
      render "new"
    end
  end

  def destroy
    session[:group_id] = nil
    redirect_to root_url, :notice => "Abgemeldet!"
  end

end
