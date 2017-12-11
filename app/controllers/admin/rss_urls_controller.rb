class Admin::RssUrlsController < AdminsController
  before_action :set_rss_url, only: [:show, :edit, :update, :destroy]
  def index
    @rss_urls = RssUrl.all.page(params[:page]).per 5
  end
  def new
    @rss = RssUrl.new
  end
  def edit

  end
  def create
    @rss = RssUrl.create rss_url_params
    if @rss.save
      flash[:info] = "Thêm thành công"
      redirect_to admin_rss_urls_path
    else
      flash[:danger] = "Thêm thất bại"
      render :new
    end
  end
  def update
    @rss.update_attributes rss_url_params
    if @rss.save
      flash[:info] = "Sửa thành công"
      redirect_to admin_rss_urls_path
    else
      flash[:danger] = "Sửa thất bại"
      render :edit
    end
  end
  def destroy
    @rss.destroy
    respond_to do |format|
      format.js
    end
  end
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_rss_url
      @rss = RssUrl.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def rss_url_params
      params.require(:rss_url).permit(:news_site_id, :category_id, :url)
    end

end
