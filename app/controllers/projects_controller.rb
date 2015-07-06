class ProjectsController < ApplicationController
	
    def create
        @Project = Project.new(params[:project])

        if @Project.save

        end

        #Debug/ Display the Errors
        @Project.errors.full_messages.each do |msg|
            puts msg
        end

        respond_to do |format|
            format.js
        end
    end

    def grab_project
        puts "got here"

        respond_to do |format|
            format.json {
                @projects = Project.all.take(10)   

                render :json => @projects
            }
        end
    end

end
