Rails.application.routes.draw do

  resources :blogs
  resources :categories
  devise_for :admins
  resources :rss_urls
  devise_for :users, controllers: {sessions: "sessions", passwords: "passwords"}

  resources :news
  resources :users
  resources :category_groups

  resources :news_sites
  root "homes#index"
end
