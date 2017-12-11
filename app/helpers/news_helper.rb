module NewsHelper

  def get_news_by_category_group category_group_id
    list = Category.get_list_category(category_group_id).pluck(:id)
    News.get_news_by_list_category(list).ordered_by_date.limit(7)
  end

  def get_news_by_user user
    list_cate_group = user.user_category_groups.pluck(:id)
    list_category = Category.get_list_category_by_list(list_cate_group).pluck(:id)
    News.get_news_by_list_category(list_category).ordered_by_date.page(params[:page]).per 8
  end
end

