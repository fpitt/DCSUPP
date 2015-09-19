class ProjectsController < ApplicationController

	#   create a new project
    def create
        respond_to do |format|
            format.json {
                param = params[:payload]

                @project = Project.new()
                @project.update_attribute(:title, param[:title])
                @project.update_attribute(:text, param[:text])
                @project.update_attribute(:deadline_date, param[:deadline_date])
                @project.update_attribute(:user, @current_user)
                @project.update_attribute(:completed, false)

                #   add project requirements to project

                #   add student attribute project requirements to project
                if param[:requirements]
                    for requirement in param[:requirements]
                        @requirement = ProjectRequirement.new()
                        @requirement.update_attribute(:requirement_subcategory, RequirementSubcategory.find_by_id(requirement[:id]))
                        @requirement.update_attribute(:project, @project)
                        @requirement.save
                    end
                end

                # add non student attribute project requirements to project
                if param[:details]
                    for detail in param[:details]
                        @requirement = ProjectRequirement.new()
                        @requirement.update_attribute(:requirement_subcategory, RequirementSubcategory.find_by_id(detail[:id]))
                        @requirement.update_attribute(:value, detail[:value])
                        @requirement.update_attribute(:project, @project)
                        @requirement.save
                    end
                end

                if @project.save
                    render :json => @project
                else
                    render :nothing => true, :status => 200, :content_type => 'text/html'
                end
            }
        end
    end

    #   get a page of 10 projects ("Current Projects" page)
    def grab_project
        project_size = Project.all.length
        current_offset = (params[:payload][:pagenumber] - 1)*10
        direction = params[:payload][:direction]

        respond_to do |format|
            format.json {

                if current_offset + direction < project_size && current_offset + direction >= 0
                    offset = current_offset + direction
                    @projects = Project.all.offset(offset).take(10)
                    render :json => @projects
                else 
                    render :nothing => true, :status => 200, :content_type => 'text/html'
                end
                             
            }
        end
    end

    def grab_in_progress_project
        respond_to do |format|
            format.json {
                project_size = Project.where(:completed => false).length
                current_offset = (params[:payload][:pagenumber] - 1)*10
                direction = params[:payload][:direction]

                if current_offset + direction < project_size && current_offset + direction >= 0
                    offset = current_offset + direction
                    @projects = Project.where(:completed => false).offset(offset).take(10)
                    render :json => @projects
                else
                    render :nothing => true, :status => 200, :content_type => 'text/html'
                end
            }
        end
    end

    def grab_completed_project
        project_size = Project.where(:completed => true).length
        current_offset = (params[:payload][:pagenumber] - 1)*10
        direction = params[:payload][:direction]

        respond_to do |format|
            format.json {

                if current_offset + direction < project_size && current_offset + direction >= 0
                    offset = current_offset + direction
                    @projects = Project.where(:completed => true).offset(offset).take(10)
                    render :json => @projects
                else
                    render :nothing => true, :status => 200, :content_type => 'text/html'
                end

            }
        end
    end

    #   update a project
    def update
        respond_to do |format|
            format.json {
                param = params[:payload]
                @project = Project.find_by_id(param[:id])
                if @project
                    @project.update_attribute(:title, param[:title])
                    @project.update_attribute(:text, param[:text])
                    @project.update_attribute(:deadline_date, param[:deadline_date])
                    @project.update_attribute(:user, @current_user)

                     #   add project requirements to project

                     #   add student attribute project requirements to project
                    if param[:requirements]
                        for subcategory in param[:requirements]
                            @requirement = ProjectRequirement.where(:requirement_subcategory => RequirementSubcategory.find_by_id(subcategory[:id]), :project => @project).first_or_create
                            @requirement.save
                        end
                    end

                    #   add non student attribute project requirements to project
                    if param[:details]
                        for subcategory in param[:details]
                            @requirement = ProjectRequirement.where(:requirement_subcategory => RequirementSubcategory.find_by_id(subcategory[:id]), :project => @project).first_or_create
                            @requirement.update_attribute(:value, subcategory[:value])
                            @requirement.save
                            end
                        end

                    if @project.save
                        render :json => @user
                    else
                        render :nothing => true, :status => 200, :content_type => 'text/html'
                    end
                end
            }
        end
    end

    #   get all projects belonging to the current user
    #   only professors (and admins, for testing purposes) have access to this endpoint
    def get_projects_of_user
        respond_to do |format|
            format.json {
                #param = params[:payload]
                #@user = User.find_by_id(param[:id])
                @projects = Project.where(:user_id => @current_user.id)
                if @projects
                    render :json => @projects
                else
                    render :nothing => true, :status => 200, :content_type => 'text/html'
                end
            }
        end
    end

    def get_completed_projects_of_current_user
        respond_to do |format|
            format.json {
                @projects = Project.where(:user_id => @current_user.id, :completed => true)
                if @projects
                    render :json => @projects
                else
                    render :nothing => true, :status => 200, :content_type => 'text/html'
                end
            }
        end
    end

    def get_in_progress_projects_of_current_user
        respond_to do |format|
            format.json {
                @projects = Project.where(:user_id => @current_user.id, :completed => false)
                if @projects
                    render :json => @projects
                else
                    render :nothing => true, :status => 200, :content_type => 'text/html'
                end
            }
        end
    end

    #   get project by its id
    def show 
        respond_to do |format|
            format.json {

                @project = Project.find_by_id(params[:id])

                if @project
                    render :json => @project
                else
                    render :nothing => true, :status => 200, :content_type => 'text/html'
                end
            }
        end
    end

    #   set project as being completed
    def set_project_completed
        respond_to do |format|
            format.json {
                @project = Project.find_by_id(params[:payload][:project])

                if @project
                    @project.update_attribute(:completed, true)
                    @project.save
                    render :json => @project
                else
                    render :nothing => true, :status => 200, :content_type => 'text/html'
                end
            }
        end
    end

    #   get filtered list of projects by subcategories
    def filter_projects
        respond_to do |format|
            format.json {
                @projects = Project.all
                param = params[:payload]

                #   go through each filter and get projects matching all filters
                if param[:filter]
                    for filter in param[:filter]

                        #   get projects matching current filter
                        if filter[:name] == 'In-progress'
                            @filter_project = Project.where(:completed => false)
                        elsif filter[:name] == 'Completed'
                            @filter_project = Project.where(:completed => true)
                        else
                            @project_requirements = ProjectRequirement.where(:requirement_subcategory_id => filter[:id])
                            @filter_project = Array.new
                            for req in @project_requirements
                                @filter_project.push(Project.find_by_id(req.project_id))
                            end
                        end

                        #   exclude projects
                        #   that don't have current filter from list
                        @new_project_list = Array.new
                        for item in @filter_project
                            if @projects.include?(item)
                                @new_project_list.push(item)
                            end
                        end
                        @projects = @new_project_list
                    end
                end

                #   grab a page of projects (10)
                direction = param[:direction]
                current_offset = (params[:payload][:pagenumber] - 1)*10

                if @projects and current_offset + direction < @projects.length && current_offset + direction >= 0
                    offset = current_offset + direction
                    render :json => @projects[offset, offset + 10]
                else
                    render :nothing => true, :status => 200, :content_type => 'text/html'
                end
            }
        end
    end



end

