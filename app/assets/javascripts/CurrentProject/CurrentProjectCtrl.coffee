controllerFunction = ($scope, requestService) ->

	$scope.pagenumber = 1
	$scope.projects = null
	$scope.url = '/flip_student_settings.json'
	$scope.sendParams = 
		pageNumber: $scope.pagenumber
		dataType: 'StudentAttributes'
		url: $scope.url

	$scope.flip = (direction) ->
		requestService.flip(direction, $scope.sendParams)


angular
	.module('dcsupp')
	.controller('CurrentProjectCtrl', ['$scope', 'requestService', controllerFunction])