controllerFunction = ($scope, requestService, modalService) ->
	$scope.modalService = modalService

	$scope.project =
		title: ""
		text: ""
	$scope.projectDefault =
		title: ""
		text: ""
	$scope.sendParams =
		url: '/projects.json'
		method: "POST"

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
	.controller('CreateProjectCtrl', ['$scope', 'requestService', '$modal', 'modalService', controllerFunction])

