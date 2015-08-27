class RatingsController < ApplicationController
    def create
        respond_to do |format|
            format.json {
                param = params[:payload]
                @rating = Rating.new()
                @rating.update_attribute(:professor_id, @current_user.id)
                @rating.update_attribute(:user, param[:student])
                @rating.update_attribute(:comment, param[:comment])
                @rating.update_attribute(:project_rating, param[:project_rating])

                if param[:project_rating]
                    @rating.update_attribute(:project, Project.find_by_id(param[:project]))

                @rating.update_attribute(:rating, param[:rating])

                if @rating.save
                    render :json => @rating
                else
                    render :nothing => true, :status => 200, :content_type => 'text/html'
                end
            }
        end
    end


    def get_ratings_of_student
        respond_to do |format|
            format.json {
                @ratings = Rating.where(:user_id, params[:student])
                if @rating
                    render :json => @rating
                else
                    render :nothing => true, :status => 2--, :content_type => 'text/html'
                end
            }
        end
    end

end
