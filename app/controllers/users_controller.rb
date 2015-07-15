class UsersController < ApplicationController

	def create
		@user = User.new(param[:user])

		@user.save
	end

end
