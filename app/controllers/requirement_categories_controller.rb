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
			"SELECT DISTINCT requirement_categories.category_name 
				FROM requirement_categories
				WHERE ID in (SELECT requirement_category_id
							FROM requirement_subcategories
							WHERE student_attribute = 't')
			ORDER BY requirement_categories.created_at desc")

		puts @student_attributes.size

        current_offset = (params[:payload][:pagenumber] - 1)*10
        direction = params[:payload][:direction]
		attribute_length = @student_attributes.size

		respond_to do |format|
	      	format.json {
	      	    if current_offset + direction < attribute_length && current_offset + direction >= 0
                    offset = current_offset + direction
                    offset_10 = offset + 10
                    @projects = @student_attributes[offset..offset_10]
                    render :json => @projects
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
