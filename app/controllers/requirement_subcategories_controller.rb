class RequirementSubcategoriesController < ApplicationController

	def create

		puts params[:payload]

		@subcategory = RequirementSubcategory.new(params[:payload][:subcategory])

		@category = RequirementCategory.find_by_id(params[:payload][:target_id])

		respond_to do |format|
	    	format.json {
	    		if @subcategory.save
	    			@subcategory.requirement_category = @category
	  				render :json => @category
	  			else
	  				render :nothing => true, :status => 200, :content_type => 'text/html'
	    		end
	    	}
	    end
	end
	
end
