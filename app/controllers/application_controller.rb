class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :load_cate_group, :set_locale
  def admin!
		if !current_user.admin?
			redirect_to root_path
		end
	end
  def load_cate_group
    @cate_groups = CategoryGroup.all
  end

  private
  def set_locale
    I18n.locale = session[:locale] || I18n.default_locale
    session[:locale] = I18n.locale
  end
end
