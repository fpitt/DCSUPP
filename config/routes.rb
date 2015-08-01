Rails.application.routes.draw do
    devise_for :users
    # The priority is based upon order of creation: first created -> highest priority.
    # See how all your routes lay out with "rake routes".

    # You can have the root of your site routed with "root"
    # root 'welcome#index'
    resources :users, only: [:create, :update, :destroy, :show]
    resources :projects, only: [:create, :update, :destroy, :show]
    resources :requirement_categories, only: [:create, :update, :destroy]
    resources :requirement_subcategories, only: [:create, :update, :destroy]
    resources :project_applications, only: [:create, :update, :destroy]

    root to: "application#introduction"

    post '/flip_direction', to: 'requirement_categories#flip_direction'
    post '/flip_project_direction', to: 'projects#grab_project'
    post '/get_categories', to: 'requirement_categories#getcategories'
    post '/get_subcategories', to: 'requirement_categories#subcategories'
    post '/flip_student_settings', to: 'requirement_categories#flip_students'


    post "/current_user" => 'users#get_current_user'
    post "/students" => 'users#students'
    post "/get_projects_of_user" => 'projects#get_projects_of_user'

    get "/*path" => redirect("/?goto=%{path}")
end