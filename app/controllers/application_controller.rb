class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :load_cate_group
  def admin!
		if !current_user.admin?
			redirect_to root_path
		end
	end
  def load_cate_group
    @cate_groups = CategoryGroup.all
  end
end
