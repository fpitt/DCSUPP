controllerFunction = ($scope, requestService, $modal) ->

	$scope.pagenumber = 1
	$scope.projects = null
	$scope.url = '/flip_project_direction.json'
	$scope.sendParams =
		pageNumber: $scope.pagenumber
		url: $scope.url
		method: "POST"
	$scope.payload = 
		group:
			title: "testtitle"
			description: "test description"

	$scope.changeSettings = (size) ->
		modalInstance = $modal.open(
			animation: true
			templateUrl: 'CreateProject/CreateProjectSettings/create_project_settings.html'
			controller: 'CreateProjectSettingsCtrl'
			size: size
			resolve: items: ->
				$scope.items
		)
		modalInstance.result.then ((selectedItem) ->
			$scope.selected = selectedItem
			return
		), ->
		return

	$scope.viewInfo = (size) ->
		modalInstance = $modal.open(
			animation: true
			templateUrl: 'CreateProject/CreateProjectSettings/create_project_info.html'
			controller: 'CreateProjectSettingsCtrl'
			size: size
			resolve: items: ->
				$scope.items
		)
		modalInstance.result.then ((selectedItem) ->
			$scope.selected = selectedItem
			return
		), ->
		return



	successFunction = (data) ->
		$scope.projects = data
		console.log($scope.projects)


	$scope.flip = (direction) ->

		requestService.service($scope.sendParams, $scope.payload).success(successFunction)


angular
	.module('dcsupp')
	.controller('CreateProjectCtrl', ['$scope', 'requestService', '$modal', controllerFunction])

