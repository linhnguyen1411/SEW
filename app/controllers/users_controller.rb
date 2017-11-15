class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :admin!
  before_action :load_user

  def index
    @users = User.all
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

  def update # patch
    if @user.update_attributes user_params
      flash[:success] = "Update thành công"
      redirect_to @user
    else
      render :edit
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
      :password_confirmation, :roles
  end

  def load_user
    @user = User.find_by id: params[:id]
    # return if @user
    # flash[:danger] = "User không tồn tại"
    # redirect_to users_url
  end
end
