class UserVideosController < ApplicationController
  before_action :load_user_video

  def create
    @user_video = UserVideo.create user_video_params
    if @user_video.save
      @success = true
    else
      @success = false
    end
    respond_to do |format|
      format.js
    end
  end

  def edit
    respond_to do |format|
      format.js
    end
  end

  def update
    @user_video.update_attributes user_video_params
    if @user_video.save
      @success = true
    else
      @success = false
    end
    respond_to do |format|
      format.js
    end
  end

  def destroy
     @success = false
    if @user_video.destroy
      @success = true
    else
      @success = false
    end
    respond_to do |format|
      format.js
    end
  end

  private
  def user_video_params
    params.require(:user_video).permit :user_id, :title, :url
  end

  def load_user_video
    @user_video = UserVideo.find_by id: params[:id]
  end
end
