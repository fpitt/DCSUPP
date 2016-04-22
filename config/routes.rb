Rails.application.routes.draw do
    devise_for :users

    root to: 'application#introduction'

    resources :users, only: [:create, :update, :destroy, :show]
    controller :users do
        post "/current_user" => :get_current_user
        post "/students" => :students
        post "/flip_professor_direction" => :grab_professors
        post "/get_professor_containing_keyword" => :get_professor_containing_keyword
        post "/filter_students" => :filter_students
        post "/user_information" => :information
    end

    resources :requirement_categories, only: [:create, :update, :destroy]
    controller :requirement_categories do 
        post '/flip_direction' => :flip_direction
        post '/get_categories' => :getcategories
        post '/get_subcategories' => :subcategories
        post '/flip_student_settings' => :flip_students
        post '/get_category' => :getcategory
    end

    resources :student_attributes, only: [:create, :destroy, :show, :update]
    controller :student_attributes do
        post "/get_all_attributes" => :user_attributes
        post '/get_attribute_by_user_and_subcategory' => :get_attribute_by_user_and_subcategory
        post '/get_student_attributes_of_student' => :get_student_attributes_of_student
    end

    resources :projects, only: [:create, :update, :destroy, :show]
    controller :projects do 
        post '/flip_project_direction' => :grab_project
        post "/get_projects_of_user" => :get_projects_of_user
        post "/flip_in_progress_direction" => :grab_in_progress_project
        post "/flip_completed_direction" => :grab_completed_project
        post "/get_in_progress_projects_of_current_user" => :get_in_progress_projects_of_current_user
        post "/get_completed_projects_of_current_user" => :get_completed_projects_of_current_user
        post "/set_project_completed" => :set_project_completed
        post "/filter_projects" => :filter_projects
        post "/project_page_number" => :pages
    end

    resources :project_applications, only: [:create, :update, :destroy, :show]
    controller :project_applications do 
        post "/get_applications_of_user" => :get_applications_of_user
        post "/get_applications_of_project" => :get_applications_of_project
        post "/process_offer" => :process_offer
        post "/get_require_administrator_approval_applications" => :get_require_administrator_approval_applications
        post "/get_project_assignments" => :get_project_assignments
        post "/upload_resume" => :upload_resume
        post "/flip_applications_of_user" => :flip_applications_of_user
    end

    controller :project_requirements do
        post "/get_requirements_of_project" => :get_requirements_of_project
    end

    resources :requirement_subcategories, only: [:create, :update, :destroy, :show]
    controller :requirement_subcategories do
        post "/get_all_subcategories" => :show_all
        post "/student_attribute_requirement_subcategories_with_keyword" => :student_attribute_requirement_subcategories_with_keyword
        post "/non_student_attribute_requirement_subcategories_with_keyword" => :non_student_attribute_requirement_subcategories_with_keyword
        post "get_student_attribute_subcategories_of_project" => :get_student_attribute_subcategories_of_project
        post "get_non_student_attribute_subcategories_of_project" => :get_non_student_attribute_subcategories_of_project
        post "/requirement_suggestion" => :get_subcategories_containing_keyword
    end

    resources :references, only: [:create]
    controller :references do
        post "/get_by_project" => :get_by_project
        post "/get_reference_requests_of_professor" => :get_reference_requests_of_professor
        post "/process_reference_approval" => :process_reference_approval
        post "/add_professor_reference_text" => :add_professor_reference_text
        post "/get_by_project_application" => :get_by_project_application
        post "/get_student_approved_by_project_application" => :get_student_approved_by_project_application
    end

    resources :ratings, only: [:create]
    controller :ratings do
        post "/get_ratings_of_student" => :get_ratings_of_student
    end

    #URL Routing Path
    get "/*path" => redirect("/?goto=%{path}")
end