class StaticPagesController < ApplicationController

    before_action :find_user

    def project
    	
    end

    def introduction

    end

    #Private Methods ----------->
    private 

        def find_user
            @current_user = current_user
        end
end
