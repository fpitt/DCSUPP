class RequirementCategoriesController < ApplicationController

	def create
		param = params[:payload]

		@category = RequirementCategory.new(param[:requirement_category])

		respond_to do |format|
			format.json {
	  			if @category.save
	  				render :json => @category
	  			else
	  				render :nothing => true, :status => 200, :content_type => 'text/html'
	    		end
	    	}
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

	def flip_students
		@student_attributes = RequirementCategory.find_by_sql(
			"SELECT DISTINCT requirement_categories.category_name FROM requirement_categories
			INNER JOIN requirement_subcategories on
			requirement_categories.id = requirement_subcategories.requirement_category_id AND
			requirement_subcategories.student_attribute = '1'
			ORDER BY requirement_categories.created_at desc")

		attribute_length = @student_attributes.length
		value = params[:direction].to_i + (params[:pageNumber]).to_i*10 - 10

		respond_to do |format|
	      format.json {
	      	puts value
	      	if value < attribute_length
		      	@category = @student_attributes[value .. value + 10]
		        render :json => @category
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
