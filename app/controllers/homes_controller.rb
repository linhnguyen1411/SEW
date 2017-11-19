class HomesController < ApplicationController
  def index
  @cate_groups = CategoryGroup.all
  n = News.limit(13).ordered_by_date
  @news = n.limit(4)
  @five_news = n[5..12]

  @test = News.limit(6).ordered_by_date
  @test1 = News.limit(10).ordered_by_date
  @test2 = News.limit(4).ordered_by_date
  @test3 = News.limit(5).ordered_by_date
  #lấy tin khoa học
  list = CategoryGroup.find 4
  list = list.categories.pluck(:id)
  @khoahoc = News.get_news_by_cate_group(list).limit(6).ordered_by_date
  #end

  #lấy tin kinh tế
  kt = CategoryGroup.find 2
  kt = kt.categories.pluck(:id)
  @kinhte = News.get_news_by_cate_group(kt).limit(6).ordered_by_date
  end
end
