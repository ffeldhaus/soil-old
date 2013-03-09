class SessionsController < ApplicationController
  skip_before_filter :require_login

  def new
  end

  def create
    group = Group.find_by_groupname(params[:groupname])
    if group && group.authenticate(params[:password])
      session[:group_id] = group.id
      redirect_to root_url, :notice => "Logged in!"
    else
      flash.now.alert = "Invalid email or password"
      render "new"
    end
  end

  def destroy
    session[:group_id] = nil
    redirect_to root_url, :notice => "Logged out!"
  end

end
