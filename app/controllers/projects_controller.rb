class ProjectsController < ApplicationController
	
    def create
        respond_to do |format|
            format.json {
                param = params[:payload]

                @project = Project.new(param[:project])

                if @project.save
                    render :json => @project
                else
                    render :nothing => true, :status => 200, :content_type => 'text/html'
                end
            }
        end
    end

    def grab_project
        puts params[:payload]

        take = rand(1..9)

        respond_to do |format|
            format.json {
                @projects = Project.all.offset(take).take(10)   

                render :json => @projects
            }
        end
    end

    def update
        respond_to do |format|
            format.json {
            param = params[:payload]
                @project = Project.find_by_id(param[:id])
                if @project
                    @project.title = param[:title]
                    @project.text = param[:text]

                    if @project.save
                        render :json => @user
                    else
                        render :nothing => true, :status => 200, :content_type => 'text/html'
                    end
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
