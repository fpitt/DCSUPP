class StudentAttributesController < ApplicationController

    #   get the current user's student attribute give given subcategory
    def get_attribute_by_user_and_subcategory
        respond_to do |format|
            format.json {
                @student_attribute = StudentAttribute.find_by_requirement_subcategory_id_and_user_id(params[:payload][:subcategory], @current_user.id)
                if @student_attribute
                    render :json => @student_attribute
                else
                    render :nothing => true, :status => 200, :content_type => 'text/html'
                end
            }
        end
    end

    #   get all of this user's student attributes for a given category
    def user_attributes
        respond_to do |format|
            format.json{
                puts params[:payload]
                @payload = params[:payload]

                @student_attributes = StudentAttribute.where(:requirement_category_id => @payload[:category_id], :user_id => @payload[:user_id])
                render :json => @student_attributes
            }
        end
    end


    #   get all student attribute belonging to given student
    def get_student_attributes_of_student
        respond_to do |format|
            format.json{
                @student_attributes = StudentAttribute.where(:user_id => params[:payload][:student])
                render :json => @student_attributes
            }
        end
    end


    #Update/ Create Student Attribute
    def update

    end

    def create

        respond_to do |format|
            format.json{
                @payload = params[:payload]
                @requirement_subcategory = RequirementSubcategory.find_by_id(@payload[:subcategory_id])
                @requirement_category = RequirementCategory.find_by_id(@payload[:category_id])

                @attribute = StudentAttribute.find_or_create_by(requirement_subcategory_id: @requirement_subcategory.id, requirement_category_id: @requirement_category.id)

                if (@requirement_subcategory.attribute_type == "Date")
                    @attribute.update_attribute(:value, @payload[:payload][:input_date].to_date)
                elsif (@requirement_subcategory.attribute_type == "Number")
                    @attribute.update_attribute(:value, @payload[:payload][:input_number].to_i)
                elsif (@requirement_subcategory.attribute_type == "Boolean")
                    @attribute.update_attribute(:value, @payload[:payload][:input_boolean])
                elsif (@requirement_subcategory.attribute_type == "Input Field")
                    @attribute.update_attribute(:value, @payload[:payload][:input_text])
                end

                @attribute.update_attribute(:user_id, @current_user.id)

                if @attribute.save
                    render :json => @attribute
                else
                    #We got an error
                    render :nothing => true, :status => 200, :content_type => 'text/html'
                end
            }
        end

    end

end
