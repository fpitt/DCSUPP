controllerFunction = ($scope, requestService, $modal) ->

	$scope.project =
		title: ""
		text: ""
	$scope.projectDefault =
		title: ""
		text: ""
	$scope.sendParams =
		url: '/projects.json'
		method: "POST"

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
		console.log("Created Project")
		clearForm()


	clearForm = ->
		$scope.project = angular.copy($scope.projectDefault)


	$scope.create = ->
		$scope.payload = 
			project:
				title: $scope.project.title
				text: $scope.project.text

		requestService.service($scope.sendParams, $scope.payload).success(successFunction)
	

	$('[data-toggle="tooltip"]').tooltip()


angular
	.module('dcsupp')
	.controller('CreateProjectCtrl', ['$scope', 'requestService', '$modal', controllerFunction])

