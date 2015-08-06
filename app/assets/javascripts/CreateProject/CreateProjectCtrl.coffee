controllerFunction = ($scope, modalService, User, Project, RequirementCategory, RequirementSubcategory) ->
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

		# --- Get SubCategory ---

	$scope.loadSubcategories = (id)->
		payload =
			target_id: id
		$scope.current_category_id = id

		RequirementSubcategory.getAll(payload).success((data) ->
			$scope.subcategories = data)

		# --- Category Navigation ---

	$scope.flip = (pushDirection) ->
			payload =
				direction: pushDirection
				pagenumber: $scope.pagenumber
			$scope.direction = pushDirection

			RequirementCategory.flip(payload).success((data) ->
				if (data)
					$scope.categories = data
					if $scope.direction > 0
						$scope.pagenumber += 1
					else if $scope.direction < 0
						$scope.pagenumber -= 1
					else
						$scope.pagenumber = 1)




	$scope.open = ($event) ->
		$scope.opened = !$scope.opened
		return

	$scope.flip(0)



angular
	.module('dcsupp')
	.controller('CreateProjectCtrl', ['$scope', 'modalService', 'User', 'Project', 'RequirementCategory', 'RequirementSubcategory', controllerFunction])

