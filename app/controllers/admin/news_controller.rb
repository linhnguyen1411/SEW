class Admin::NewsController < AdminsController
  require "rss"
  require "open-uri"
  before_action :set_news, only: [:show, :edit, :update, :destroy]

  def index
    @news = News.all.ordered_by_date.page(params[:page]).per 10
  end

  def show
  end

  def new
    if params[:more_params].present?
      rss_feed
    else
      @news = News.new
    end
  end

  def create
    news_params[:pubDate] = Time.now
    news_params[:rss_url_id] = 1
    @news = News.new(news_params)
    respond_to do |format|
      if @news.save
        format.html { redirect_to admin_news_index_path, notice: 'Tạo mới tin thành công' }
      else
        format.html { render :new }
      end
    end
  end

  def edit
  end

  def update
  end

  def destroy
    @news.destroy
    respond_to do |format|
      format.js
    end
  end

  def rss_feed
    rss_links = RssUrl.all
    rss_links.each do |rss_link|
      if rss_link.news_site_id == 1
        vnexpress_news rss_link
        @rss_results.each do |rss_result|
          news = News.create(rss_result)
        end
      elsif rss_link.news_site_id == 2
        vnn_news rss_link
        @rss_results.each do |rss_result|
          news = News.create(rss_result)
        end
      end
    end
  end
  private

    def set_news
      @news = News.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def news_params
      params.require(:news).permit(:category_id, :title, :description, :pubDate, :link, :highlight, :image, :rss_url_id)
    end

    def vnexpress_news rss_link
      @rss_results = []
      rss = RSS::Parser.parse(open(rss_link.url).read, false).items[0..10]
      rss.each do |result|

        index = result.description.index('</br>')
        index = index + 4
        image = result.description.to(index)
        result.description = result.description.from(index+1).to(-1)
        result = { rss_url_id: rss_link.id, news_site_id: rss_link.news_site_id,
          category_id: rss_link.category_id,title: result.title, pubDate: result.pubDate,
          link: result.link, description: result.description, image: image,
          highlight: 0 }
        @rss_results.push(result)
      end
      return @rss_results
    end

    def vnn_news rss_link
      @rss_results = []
      rss = RSS::Parser.parse(open(rss_link.url).read, false).items[0..10]
      rss.each do |result|
        index = result.description.index('<br />')
        index = index - 1
        image = result.description.from(index+7).to(-1)
        result.description = result.description.to(index)
        result = { rss_url_id: rss_link.id, news_site_id: rss_link.news_site_id,
          category_id: rss_link.category_id,title: result.title, pubDate: result.pubDate,
          link: result.link, description: result.description, image: image,
          highlight: 0}
        @rss_results.push(result)
      end
      return @rss_results
    end
end
