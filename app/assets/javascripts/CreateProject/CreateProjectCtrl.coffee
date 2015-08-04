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

	clearForm = ->
		$scope.project = angular.copy($scope.projectDefault)

	$scope.create = ->
		$scope.payload =
			project:
				$scope.project
			requirements:
				$scope.requirements

		requestService.service($scope.sendParams, $scope.payload).success((data) ->
			console.log("Created Project")
			clearForm())

	$scope.loadCategories = (pushDirection) ->
		payload =
			direction: pushDirection
			pagenumber: $scope.pagenumber
		sendParams =
			method: 'POST'
			url: '/get_categories.json'
		$scope.direction = pushDirection

		requestService.service(sendParams, payload).success((data) ->
			$scope.list_subcategories = data
			console.log($scope.list_subcategories))

	$scope.loadSubcategories = (target_id)->
		console.log("subcategories")
		payload =
			target_id: event.target.id
		get_subcategories =
			method: 'POST'
			url: '/get_subcategories.json'
		$scope.current_category_id = event.target.id

		requestService.service(get_subcategories, payload).success((data) ->
			if (data)
				$scope.categories = data)
#				if $scope.direction > 0
#					$scope.pagenumber += 1
#				else if $scope.direction < 0
#					$scope.pagenumber -= 1
#				else
#					$scope.pagenumber = 1)



	$('[data-toggle="tooltip"]').tooltip()


	$scope.open = ($event) ->
		$scope.opened = !$scope.opened
		return



angular
	.module('dcsupp')
	.controller('CreateProjectCtrl', ['$scope', 'requestService', 'modalService', 'User', controllerFunction])

