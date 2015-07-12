controllerFunction = ($scope, requestService) ->

	$scope.pagenumber = 1
	$scope.projects = null
	$scope.url = '/flip_project_direction.json'
	$scope.sendParams =
		url: $scope.url
		method: "POST"
	$scope.payload = 
		group:
			title: "testtitle"
			description: "test description"


	successFunction = (data) ->
		$scope.projects = data
		console.log($scope.projects)


	$scope.flip = (pushDirection) ->
		$scope.payload["direction"] = pushDirection

		requestService.service($scope.sendParams, $scope.payload).success(successFunction)


angular
	.module('dcsupp')
	.controller('CurrentProjectCtrl', ['$scope', 'requestService', controllerFunction])