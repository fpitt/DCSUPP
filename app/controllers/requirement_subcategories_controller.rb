class RequirementSubcategoriesController < ApplicationController

	def create

		respond_to do |format|
	    	format.json {
				puts params[:payload]
				@subcategory = RequirementSubcategory.new(params[:payload][:subcategory])
				@category = RequirementCategory.find_by_id(params[:payload][:target_id])
	    		if @subcategory.save
	    			if @category
		    			puts "-----"
		    			@subcategory.requirement_category = @category
		    			@subcategory.save
		  				render :json => @subcategory
		  			end
	  			else
	  				render :nothing => true, :status => 200, :content_type => 'text/html'
	    		end
	    	}
	    end
	end

    def update
        respond_to do |format|
            format.json{
                puts params[:payload]

                @requirement_subcategory = RequirementSubcategory.update_attributes()

                render :nothing => true, :status => 200, :content_type => 'text/html'
            }
        end
    end

    def show
        respond_to do |format|
            format.json {

                @requirement_subcategory = RequirementSubcategory.find_by_id(params[:id])

                if @requirement_subcategory
                    render :json => @requirement_subcategory
                else
                    render :nothing => true, :status => 200, :content_type => 'text/html'
                end
            }
        end
    end

    def show_all
        respond_to do |format|
            format.json {

                @requirement_subcategories = RequirementSubcategory.all

                if @requirement_subcategories
                    render :json => @requirement_subcategories
                else
                    render :nothing => true, :status => 200, :content_type => 'text/html'
                end
            }
        end
    end


    def requirement_subcategories_with_keyword
        respond_to do |format|
            format.json {
                param = params[:payload]
                    @requirement_subcategories = RequirementSubcategory.where('sub_category_name LIKE ?', '%' + param[:keyword] + '%').all
                    if @requirement_subcategories
                        render :json => @requirement_subcategories
                    else
                        render :nothing => true, :status => 200, :content_type => 'text/html'
                    end
            }
        end
    end

	
end
