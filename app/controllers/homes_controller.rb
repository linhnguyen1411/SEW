class HomesController < ApplicationController
	layout "home"
	def index
		@cate_groups = CategoryGroup.all
		@news = News.take(4)
    n = News.all
    @five_news = n[5..12]
	end
end
