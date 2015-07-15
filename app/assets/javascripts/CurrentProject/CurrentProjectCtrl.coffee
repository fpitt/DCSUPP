controllerFunction = ($scope, requestService, $modal) ->

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

	$scope.changeSettings = (size) ->
		modalInstance = $modal.open(
			animation: true
			templateUrl: 'CurrentProject/CurrentProjectSettings/current_project_settings.html'
			controller: 'CurrentProjectSettingsCtrl'
			size: size
			resolve: items: ->
				$scope.items
		)
		modalInstance.result.then ((selectedItem) ->
			$scope.selected = selectedItem
			return
		), ->
		return

	$scope.flip = (pushDirection) ->
		$scope.payload["direction"] = pushDirection

		requestService.service($scope.sendParams, $scope.payload).success(successFunction)

	$('[data-toggle="tooltip"]').tooltip()

angular
.module('dcsupp')
.controller('CurrentProjectCtrl', ['$scope', 'requestService', '$modal', controllerFunction])