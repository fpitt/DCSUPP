Rails.application.routes.draw do

  devise_for :users
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'
  resources :users
  resources :projects
  resources :requirement_categories
  resources :requirement_subcategories
  
  root to: "application#introduction"

  #Routes to the 6 main App Pages
  get '/introduction',  to: 'static_pages#introduction'
  get '/student_account',  to: 'users#student_page'
  get '/curr_project',  to: 'static_pages#project'
  get '/create_project', to: 'users#create_project'
  get '/manage_category', to: 'users#manage_category'
  get '/student_page', to: 'users#students'


  post '/flip_direction', to: 'requirement_categories#flip_direction'
  post '/flip_project_direction', to: 'projects#grab_project'
  post '/get_categories', to: 'requirement_categories#getcategories'
  post '/flip_student_settings', to: 'requirement_categories#flip_students'

  get "/project_create" => 'projects#create'

  get "/*path" => redirect("/?goto=%{path}")
end
