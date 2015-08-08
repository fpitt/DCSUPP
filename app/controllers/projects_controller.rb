class ProjectsController < ApplicationController
	
    def create
        respond_to do |format|
            format.json {
                param = params[:payload]

                @project = Project.new(param[:project])
                @project.user = @current_user

                for requirement in param[:requirements]
                    @requirement = ProjectRequirement.new()
                    @requirement.update_attribute(:requirement_subcategory, RequirementSubcategory.find_by_id(requirement[:id]))
                    @requirement.update_attribute(:project, @project)
                    @requirement.save
                end


                if @project.save
                    render :json => @project
                else
                    render :nothing => true, :status => 200, :content_type => 'text/html'
                end
            }
        end
    end

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

    def update
        respond_to do |format|
            format.json {
                param = params[:payload]
                @project = Project.find_by_id(param[:id])
                if @project
                    @project.update_attribute(:title, param[:title])
                    @project.update_attribute(:text, param[:text])
                    if @project.save
                        render :json => @user
                    else
                        render :nothing => true, :status => 200, :content_type => 'text/html'
                    end
                end
            }
        end
    end

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

end

