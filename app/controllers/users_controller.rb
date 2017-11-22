class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :load_user

  def index
    @users = User.all
  end

  def show

  end
  def new
    @user = User.new
  end

  def create # post
    @user = User.new user_params
    if @user.save
      flash[:info] = "Tạo thành công"
      redirect_to users_path
    else
      render :new
    end
  end

  def edit; end

  def update
    if params[:type] == "choose"
      @ucg = UserCategoryGroup.create user_id: params[:id], category_group_id: params[:cate_groups_id]
      if @ucg.save
        respond_to do |format|
          format.json do
            render json: {type: success, cate_groups_id: params[:cate_groups_id]}
            binding.pry
          end
        end
      end
    else
      if @user.update_attributes user_params
        @success = true
      else
        @success = false
      end
      respond_to do |format|
        format.js
      end
    end
  end

  def destroy
    @user.destroy
    flash[:success] = "Xóa thành công"
    redirect_to users_url
  end

  private

  def user_params
    params.require(:user).permit :name, :email, :password,
      :password_confirmation
  end

  def load_user
    @user = User.find_by id: params[:id]
    # return if @user
    # flash[:danger] = "User không tồn tại"
    # redirect_to users_url
  end
end
