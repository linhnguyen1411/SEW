Rails.application.routes.draw do
  get 'profile_page/show'

  resources :categories
  devise_for :admins
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  resources :rss_urls
  devise_for :users, controllers: {sessions: "sessions", passwords: "passwords"}

  resources :news
  resources :users
  resources :category_groups

  resources :news_sites
  resources :admin_pages
  get 'profile',to: 'profile_page#show'
  root "homes#index"
end
