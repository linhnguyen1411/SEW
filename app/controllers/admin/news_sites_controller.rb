class Admin::NewsSitesController < AdminsController
  def index
    @news_sites = NewsSite.all
  end
end
