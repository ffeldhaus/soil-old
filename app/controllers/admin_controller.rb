class AdminController < ApplicationController
  before_action :authorize_admin, only: [:index]

  private

  def authorize_admin
    unless admin?
      redirect_to root_url, :notice => I18n.t('access_denied')
    end
  end

end
