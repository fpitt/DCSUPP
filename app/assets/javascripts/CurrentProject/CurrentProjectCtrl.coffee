controllerFunction = ($scope, requestService) ->

	$scope.pagenumber = 1
	$scope.projects = null
	$scope.url = '/flip_project_direction.json'
	$scope.sendParams =
		pageNumber: $scope.pagenumber
		url: $scope.url

	successFunction = (data) ->
		$scope.projects = data
		console.log($scope.projects)


	$scope.flip = (direction) ->
		requestService.flip(direction, $scope.sendParams).success(successFunction)



angular
	.module('dcsupp')
	.controller('CurrentProjectCtrl', ['$scope', 'requestService', controllerFunction])