controllerFunction = ($scope, requestService, $modal, modalService) ->

	$scope.modalService = modalService

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

	$scope.items = [
		'item1'
		'item2'
		'item3'
	]

	$scope.flip = (pushDirection) ->
		$scope.payload["direction"] = pushDirection

		requestService.service($scope.sendParams, $scope.payload).success(successFunction)

	$('[data-toggle="tooltip"]').tooltip()
	$scope.flip(0)

angular
.module('dcsupp')
.controller('CurrentProjectCtrl', ['$scope', 'requestService', '$modal', 'modalService', controllerFunction])
