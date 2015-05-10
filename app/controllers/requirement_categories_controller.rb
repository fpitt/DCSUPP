class RequirementCategoriesController < ApplicationController

	def create
		@new_category = RequirementCategory.new(params[:requirement_category])

	  	if @new_category.save

	    end

	    @category = RequirementCategory.order(created_at: :desc).take(10)

	    #Debug/ Display the Errors
	    @new_category.errors.full_messages.each do |msg|
	      puts msg
	    end

	    respond_to do |format|
	      format.js
	    end
	end

	def flip_direction

		respond_to do |format|
	      format.html {

	      	@Category_length = RequirementCategory.all.length

	      	value = params[:direction].to_i + (params[:pageNumber]).to_i*10 - 10

	      	if value < @Category_length

		      	@category = RequirementCategory.order(created_at: :desc).offset(value).take(10)

		        render :partial => "users/partials/category/categoryPosts"
		    else 

		    	render :nothing => true, :status => 200, :content_type => 'text/html'

		    end

	      }
	    end

	end

	def subcategories

		respond_to do |format|
	      format.html {

	      	puts params[:category_id]

			@subcategory = RequirementSubcategory.where(requirement_category_id: 
						params[:category_id].to_i)

	      	render :partial => 'requirement_subcategories/partial/panel_listing'

	      }
	    end		

	end

end
