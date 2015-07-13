class RequirementSubcategoriesController < ApplicationController

	def create

		param = params[:payload]

		@category = RequirementSubcategory.new(param[:requirement_category])

		respond_to do |format|
	    	format.json {
	    		if @category.save
	    			puts "hi"
	  				render :json => @category
	  			else
	  				render :nothing => true, :status => 200, :content_type => 'text/html'
	    		end
	    	}
	    end
	end
	
end
