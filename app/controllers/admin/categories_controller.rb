class Admin::CategoriesController < AdminsController
  before_action :set_category, only: [:show, :edit, :update, :destroy]

  def index
    @categories = Category.all.page(params[:page]).per 10
  end

  def show
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.create category_params
    if @category.save
      flash[:info] = "Thêm thành công"
      redirect_to admin_categories_path
    else
      flash[:danger] = "Thêm thất bại"
      render :new
    end
  end

  def edit
  end

  def update
    @category.update_attributes category_params
    if @category.save
      flash[:info] = "Sửa thành công"
      redirect_to admin_categories_path
    else
      flash[:danger] = "Sửa thất bại"
      render :edit
    end
  end

  def destroy
    @category.destroy
    respond_to do |format|
      format.js
    end
  end
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_category
      @category = Category.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def category_params
      params.require(:category).permit(:category_group_id, :name)
    end
end
