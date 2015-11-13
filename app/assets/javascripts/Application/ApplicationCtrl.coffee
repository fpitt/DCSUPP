# Controller for application.html.slim in views/layouts
# used to give the page access to modalService
angular
	.module('dcsupp')
	.controller 'ApplicationCtrl', ['$scope','modalService', 'User', 
		($scope, modalService, User) ->

			$scope.modalService = modalService

			# --- Get User ---
			$scope.getUser = ->
	            User.getUser().success (data) ->
	                $scope.user = data
	            return

	        $scope.getUser()
	]
