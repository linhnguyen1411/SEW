class Admin::ChangeLanguagesController < AdminsController
  def update
    if I18n.available_locales.include? params[:locale].to_sym
      session[:locale] = I18n.locale = params[:locale]
    end
    redirect_to admins_path
  end
end
