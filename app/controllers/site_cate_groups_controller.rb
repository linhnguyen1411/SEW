class SiteCateGroupsController < ApplicationController
  before_action :set_site_cate_group, only: [:show, :edit, :update, :destroy]

  # GET /site_cate_groups
  # GET /site_cate_groups.json
  def index
    @site_cate_groups = SiteCateGroup.all
  end

  # GET /site_cate_groups/1
  # GET /site_cate_groups/1.json
  def show
  end

  # GET /site_cate_groups/new
  def new
    @site_cate_group = SiteCateGroup.new
  end

  # GET /site_cate_groups/1/edit
  def edit
  end

  # POST /site_cate_groups
  # POST /site_cate_groups.json
  def create
    @site_cate_group = SiteCateGroup.new(site_cate_group_params)

    respond_to do |format|
      if @site_cate_group.save
        format.html { redirect_to @site_cate_group, notice: 'Site cate group was successfully created.' }
        format.json { render :show, status: :created, location: @site_cate_group }
      else
        format.html { render :new }
        format.json { render json: @site_cate_group.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /site_cate_groups/1
  # PATCH/PUT /site_cate_groups/1.json
  def update
    respond_to do |format|
      if @site_cate_group.update(site_cate_group_params)
        format.html { redirect_to @site_cate_group, notice: 'Site cate group was successfully updated.' }
        format.json { render :show, status: :ok, location: @site_cate_group }
      else
        format.html { render :edit }
        format.json { render json: @site_cate_group.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /site_cate_groups/1
  # DELETE /site_cate_groups/1.json
  def destroy
    @site_cate_group.destroy
    respond_to do |format|
      format.html { redirect_to site_cate_groups_url, notice: 'Site cate group was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_site_cate_group
      @site_cate_group = SiteCateGroup.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def site_cate_group_params
      params.require(:site_cate_group).permit(:news_sites_id, :cate_groups_id)
    end
end
