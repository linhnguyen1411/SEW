class AdminsController < ActionController::Base
  before_action :authenticate_admin!
  before_action :set_locale
  layout "layouts/admin"

  private
  def set_locale
    I18n.locale = session[:locale] || I18n.default_locale
    session[:locale] = I18n.locale
  end
end
