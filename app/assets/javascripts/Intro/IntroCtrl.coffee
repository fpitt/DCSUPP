# ---------------------------------------------------------
# Page 1: Introduction Page
#
# This page is the introduction page of the DCSUPP project.
# The page is accessible without a login and contains the 
# information for the project. The page is 3 button navs.
# --------------------------------------------------------
angular.module('dcsupp').controller 'IntroCtrl', 
	['$scope', '$state', 'User', ($scope, $state, User) ->

		$scope.user = null

		#Get User Attribute on initialization
		$scope.getUser = ->
			User.getUser().success (data) ->
				$scope.user = data

		$scope.getUser()
	]
