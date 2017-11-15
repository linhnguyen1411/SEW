class HomesController < ApplicationController
	layout "home"
	def index

		@cate_groups = CategoryGroup.all
    n = News.limit(13).ordered_by_date
		@news = n.limit(4)
    @five_news = n[5..12]

    @test = News.limit(6).ordered_by_date
    @test1 = News.limit(10).ordered_by_date
    @test2 = News.limit(4).ordered_by_date
    @test3 = News.limit(5).ordered_by_date
	end
end
