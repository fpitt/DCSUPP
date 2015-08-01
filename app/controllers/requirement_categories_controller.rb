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

	def getcategories
        category_size = RequirementCategory.all.length
        current_offset = (params[:payload][:pagenumber] - 1)*10
        direction = params[:payload][:direction]

        respond_to do |format|
            format.json {

            	if current_offset + direction < category_size && current_offset + direction >= 0
                    offset = current_offset + direction
                	@categories = RequirementCategory.all.offset(offset).take(10)   
                	render :json => @categories
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
	    	format.json {
	      		param = params[:payload]

				category = RequirementCategory.find_by_id(param[:target_id])
				puts category.id

				@subcategory = category.requirement_subcategories

	      		render :json => @subcategory
	      	}
	    end		
	end
end
