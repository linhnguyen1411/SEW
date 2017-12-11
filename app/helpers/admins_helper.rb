module AdminsHelper

  def count_user
    User.all.size
  end

  def count_news
    News.all.size
  end

  def count_ctg
    CategoryGroup.all.size
  end

  def count_category
    Category.all.size
  end

  def count_site
    NewsSite.all.size
  end

  def count_rss
    RssUrl.all.size
  end
end
