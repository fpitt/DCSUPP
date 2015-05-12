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

  def get_project


  end
end
