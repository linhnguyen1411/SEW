Rails.application.routes.draw do

  resources :blogs
  devise_for :admins
  devise_for :users, controllers: {sessions: "sessions", passwords: "passwords"}

  resources :users
  resources :admins
  resources :user_musics
  resources :user_videos
  resources :category_groups

  get "/change_languages/update"
  get "admin/change_languages/update"
  namespace :admin do
    resources :users
    resources :category_groups
    resources :news
    resources :categories
    resources :rss_urls
    resources :news_sites
  end
  root "homes#index"
end
