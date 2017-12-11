Rails.application.routes.draw do

  namespace :admin do
    get 'categories/index'
  end

  namespace :admin do
    get 'categories/show'
  end

  namespace :admin do
    get 'categories/new'
  end

  namespace :admin do
    get 'categories/create'
  end

  namespace :admin do
    get 'categories/edit'
  end

  namespace :admin do
    get 'categories/update'
  end

  namespace :admin do
    get 'categories/destroy'
  end

  resources :blogs
  devise_for :admins
  resources :rss_urls
  devise_for :users, controllers: {sessions: "sessions", passwords: "passwords"}

  resources :users
  resources :admins


  resources :news_sites
  namespace :admin do
    resources :users
    resources :category_groups
    resources :news
    resources :categories
  end
  root "homes#index"
end
