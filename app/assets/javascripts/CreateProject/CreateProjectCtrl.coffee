controllerFunction = ($scope, requestService, modalService, User, Project) ->
	$scope.modalService = modalService
	$scope.opened = false
	$scope.project =
		title: ""
		text: ""
	$scope.pagenumber = 1
	$scope.direction = 0
	$scope.categories = null
	$scope.list_subcategories = null

	$scope.clearForm = ->
		projectDefault =
			title: ""
			text: ""
		$scope.project = angular.copy(projectDefault)

	$scope.create = ->
		payload =
			project:
				$scope.project
			requirements:
				$scope.requirements

		Project.create(payload).success((data) ->
			$scope.clearForm()
		)

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
	.controller('CreateProjectCtrl', ['$scope', 'requestService', 'modalService', 'User', 'Project', controllerFunction])

