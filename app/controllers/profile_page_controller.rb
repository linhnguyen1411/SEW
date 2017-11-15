class ProfilePageController < ApplicationController
  layout "home"

  def show
    @cate_groups = CategoryGroup.all
  end
end
