controllerFunction = ($scope, requestService, modalService, User) ->
	$scope.modalService = modalService
	$scope.opened = false
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
				$scope.project


		requestService.service($scope.sendParams, $scope.payload).success(successFunction)

	$('[data-toggle="tooltip"]').tooltip()


	$scope.open = ($event) ->
		$scope.opened = !$scope.opened
		return

	$scope.loadRequirementCategories = ->

	$scope.loadRequirementSubcategories = ->


angular
	.module('dcsupp')
	.controller('CreateProjectCtrl', ['$scope', 'requestService', 'modalService', 'User', controllerFunction])

