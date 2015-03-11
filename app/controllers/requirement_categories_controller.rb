class RequirementCategoriesController < ApplicationController

	def create
		@Category = RequirementCategory.new(params[:requirement_category])

	  	if @Category.save

	    end

	    puts @Category

	    #Debug/ Display the Errors
	    @Category.errors.full_messages.each do |msg|
	      puts msg
	    end

	    respond_to do |format|
	      format.js
	    end
	end
end
