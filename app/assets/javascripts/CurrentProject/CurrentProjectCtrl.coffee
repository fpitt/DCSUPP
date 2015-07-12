controllerFunction = ($scope, requestService) ->

	$scope.pagenumber = 1
	$scope.projects = null
	$scope.sendParams =
		method: 'POST'
		url: '/flip_project_direction.json'
	$scope.payload = 
		group:
			title: "testtitle"
			description: "test description"

	successFunction = (data) ->
		$scope.projects = data


	$scope.flip = (pushDirection) ->
		$scope.payload["direction"] = pushDirection

		requestService.service($scope.sendParams, $scope.payload).success(successFunction)

	$('[data-toggle="tooltip"]').tooltip()

angular
	.module('dcsupp')
	.controller('CurrentProjectCtrl', ['$scope', 'requestService', controllerFunction])