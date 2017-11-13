Rails.application.routes.draw do
  resources :rss_urls
  devise_for :users, controllers: {sessions: "sessions", passwords: "passwords"}

  resources :news
  resources :categories
  resources :users
  resources :category_groups
  resources :site_cate_groups

  resources :news_sites
  resources :admin_pages
  get 'profile',to: 'users#show'
  root "homes#index"
end
