class AdminsController < ActionController::Base
  before_action :authenticate_admin!
  layout "layouts/admin"
end
