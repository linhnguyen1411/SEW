class Admin::UsersController < AdminsController
  before_action :load_user

  def show
  end

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def edit

  end
  def create
    @user = User.new user_params
    if @user.save
      flash[:info] = "Thêm thành công"
      redirect_to admin_users_path
    else
      flash[:danger] = "Thêm thất bại"
      render :new
    end
  end

  def update
    if @user.update_attributes user_params
      flash[:info] = "Sửa thành công"
      redirect_to admin_users_path
    else
      flash[:danger] = "Sửa thất bại"
      render :edit
    end
  end

  def destroy
    @user.destroy
    respond_to do |format|
      format.js
    end
  end

  private
  def user_params
    params.require(:user).permit :name, :email, :password,
      :password_confirmation
  end

  def load_user
    @user = User.find_by id: params[:id]
  end
end
