class Admin::CategoryGroupsController < AdminsController
  before_action :set_category_group, only: [:show, :edit, :update, :destroy]

  # GET /category_groups
  # GET /category_groups.json
  def index
    @category_groups = CategoryGroup.all
  end

  # GET /category_groups/1
  # GET /category_groups/1.json
  def show
  end

  # GET /category_groups/new
  def new
    @category_group = CategoryGroup.new
  end

  # GET /category_groups/1/edit
  def edit
  end

  # POST /category_groups
  # POST /category_groups.json
  def create
    @category_group = CategoryGroup.new(category_group_params)
    if @category_group.save
      flash[:info] = "Thêm thành công"
      redirect_to admin_category_groups_path
    else
      flash[:danger] = "Thêm thất bại"
      render :new
    end
  end

  # PATCH/PUT /category_groups/1
  # PATCH/PUT /category_groups/1.json
  def update
      if @category_group.update(category_group_params)
        flash[:info] = "Sửa thành công"
        redirect_to admin_category_groups_path
      else
        flash[:danger] = "Sửa thất bại"
        redirect_to admin_category_groups_path
      end
  end

  # DELETE /category_groups/1
  # DELETE /category_groups/1.json
  def destroy
    @category_group.destroy
    respond_to do |format|
      format.js
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_category_group
      @category_group = CategoryGroup.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def category_group_params
      params.require(:category_group).permit(:name)
    end
end
