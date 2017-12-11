class UserMusicsController < ApplicationController
  before_action :load_user_music
  before_action :load_user, only: [:update, :create]

  def create
    if user_music_params[:active] == "1"
      if @user.user_musics.get_active.present?
        @user.user_musics.get_active.first.update_attributes(active: 0)
      end
    end
    @user_music = UserMusic.create user_music_params
    if @user_music.save
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
    @success = false
    if user_music_params[:active] == "1"
      if @user.user_musics.get_active.present?
        @user.user_musics.get_active.first.update_attributes(active: 0)
      end
    end
    @user_music.update_attributes user_music_params
    if @user_music.save
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
    if @user_music.destroy
      @success = true
    else
      @success = false
    end
    respond_to do |format|
      format.js
    end
  end
  private
  def user_music_params
    params.require(:user_music).permit :user_id, :title, :url, :description,
      :active
  end

  def load_user_music
    @user_music = UserMusic.find_by id: params[:id]
  end

  def load_user
    @user = User.find_by id: user_music_params[:user_id]
  end
end
