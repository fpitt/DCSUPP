class RequirementCategoriesController < ApplicationController

	def create
		@new_category = RequirementCategory.new(params[:requirement_category])

	  	if @new_category.save

	    end

	    @category = RequirementCategory.order(created_at: :desc)

	    #Debug/ Display the Errors
	    @new_category.errors.full_messages.each do |msg|
	      puts msg
	    end

	    respond_to do |format|
	      format.js
	    end
	end
end
