class HomesController < ApplicationController
  def index
  @cate_groups = CategoryGroup.oder_by_rank.limit(6)
  n = News.limit(13).ordered_by_date
  @news = n.limit(4)
  @five_news = n[5..12]
  end
end
