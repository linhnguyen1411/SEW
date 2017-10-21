class NewsController < ApplicationController
  require "rss"
  require "open-uri"
  before_action :set_news, only: [:show, :edit, :update, :destroy]

  # GET /news
  # GET /news.json
  def index
    @news = News.all
  end

  # GET /news/1
  # GET /news/1.json
  def show
  end

  # GET /news/new
  def new
    @news = News.new
    news
    @rss_results.each do |rss_result|
      news = News.create(rss_result)
    end
  end

  # GET /news/1/edit
  def edit
  end

  # POST /news
  # POST /news.json
  def create
    @news = News.new(news_params)

    respond_to do |format|
      if @news.save
        format.html { redirect_to @news, notice: 'News was successfully created.' }
        format.json { render :show, status: :created, location: @news }
      else
        format.html { render :new }
        format.json { render json: @news.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /news/1
  # PATCH/PUT /news/1.json
  def update
    respond_to do |format|
      if @news.update(news_params)
        format.html { redirect_to @news, notice: 'News was successfully updated.' }
        format.json { render :show, status: :ok, location: @news }
      else
        format.html { render :edit }
        format.json { render json: @news.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /news/1
  # DELETE /news/1.json
  def destroy
    @news.destroy
    respond_to do |format|
      format.html { redirect_to news_index_url, notice: 'News was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_news
      @news = News.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def news_params
      params.require(:news).permit(:category_id, :title, :description, :pubDate, :link)
    end

    def news
      @rss_results = []
      rss = RSS::Parser.parse(open("https://vnexpress.net/rss/tin-moi-nhat.rss").read, false).items[0..10]
      rss.each do |result|
        index = result.description.index('</br>')
        index = index + 4
        image = result.description.to(index)
        result.description = result.description.from(index+1).to(-1)
        result = { category_id: 1,title: result.title, pubDate: result.pubDate,
          link: result.link, description: result.description, image: image }
        @rss_results.push(result)
      end
      return @rss_results
    end
end
