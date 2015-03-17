Rails.application.routes.draw do

  devise_for :users
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'
  resources :users
  resources :projects
  resources :requirement_categories
  
  root to: "users#home"

  get '/home',  to: 'users#home'
  get '/curr_project',  to: 'static_pages#project'
  get '/create_project', to: 'users#create_project'
  get '/admin_categories', to: 'users#manage_category'

  patch '/savechange', to: 'users#update_profile'
  patch '/change', to: 'users#change'

  get "/project_create" => 'projects#create'
end