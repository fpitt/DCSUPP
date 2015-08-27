Rails.application.routes.draw do
    devise_for :users
    # The priority is based upon order of creation: first created -> highest priority.
    # See how all your routes lay out with "rake routes".

    # You can have the root of your site routed with "root"
    # root 'welcome#index'
    resources :users, only: [:create, :update, :destroy, :show]
    resources :projects, only: [:create, :update, :destroy, :show]
    resources :requirement_categories, only: [:create, :update, :destroy]
    resources :requirement_subcategories, only: [:create, :update, :destroy, :show]
    resources :project_applications, only: [:create, :update, :destroy, :show]
    resources :references, only: [:create]
    resources :student_attributes, only: [:create, :destroy, :show]

    root to: "application#introduction"

    #User Routes
    post "/current_user" => 'users#get_current_user'
    post "/students" => 'users#students'
    post "/flip_professor_direction" => 'users#grab_professors'
    post "/get_professor_by_name" => 'users#get_professor_by_name'

    #Requirement Categories Routes
    post '/flip_direction' => 'requirement_categories#flip_direction'
    post '/get_categories' => 'requirement_categories#getcategories'
    post '/get_subcategories' => 'requirement_categories#subcategories'
    post '/flip_student_settings' => 'requirement_categories#flip_students'

    #Student Attributes Routes
    post '/get_attribute_by_user_and_subcategory' => 'student_attributes#get_attribute_by_user_and_subcategory'

    #Projects Routes
    post '/flip_project_direction' => 'projects#grab_project'
    post "/get_projects_of_user" => 'projects#get_projects_of_user'
    post "/flip_in_progress_direction" => 'projects#grab_in_progress_project'
    post "/flip_completed_direction" => 'projects#grab_completed_project'
    post "/get_in_progress_projects_of_current_user" => 'projects#get_in_progress_projects_of_current_user'
    post "/get_completed_projects_of_current_user" => 'projects#get_completed_projects_of_current_user'
    post "/set_project_completed" => 'projects#set_project_completed'

    #Project Application Routes
    post "/get_applications_of_user" => 'project_applications#get_applications_of_user'
    post "/get_applications_of_project" => 'project_applications#get_applications_of_project'
    post "/process_offer" => 'project_applications#process_offer'
    post "/get_require_administrator_approval_applications" =>  'project_applications#get_require_administrator_approval_applications'
    post "/get_project_assignments" => 'project_applications#get_project_assignments'

    #Project Requirement Routes
    post "/get_requirements_of_project" => 'project_requirements#get_requirements_of_project'

    #Requirement SubCategories Routes
    post "/get_all_subcategories" => 'requirement_subcategories#show_all'

    #References Routes
    post "/get_by_project" => 'references#get_by_project'
    post "/get_reference_requests_of_professor" => 'references#get_reference_requests_of_professor'
    post "/process_reference_approval" => 'references#process_reference_approval'
    post "/add_professor_reference_text" => 'references#add_professor_reference_text'
    post "/get_by_project_application" => 'references#get_by_project_application'
    post "/get_student_approved_by_project_application" => 'references#get_student_approved_by_project_application'

    #Ratings Routes
    post "/get_ratings_of_student" => 'ratings#get_ratings_of_student'



    #URL Routing Path
    get "/*path" => redirect("/?goto=%{path}")
end