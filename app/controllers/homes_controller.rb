class HomesController < ApplicationController
	layout "home"
	def index
		@cate_groups = CategoryGroup.all
		@news = News.all
	end
end
