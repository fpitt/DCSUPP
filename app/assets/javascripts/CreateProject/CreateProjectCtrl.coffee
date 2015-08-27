controllerFunction = ($scope, modalService, User, Project, RequirementCategory, RequirementSubcategory) ->
	$scope.modalService = modalService
	$scope.opened = false
	$scope.project =
		title: ""
		text: ""
		deadline_date: ""
	$scope.requirements =  []
	$scope.pagenumber = 1
	$scope.direction = 0
	$scope.subcategories = []

	$scope.clearForm = ->
		projectDefault =
			title: ""
			text: ""
			deadline_date: ""
			subcategories: []
		$scope.project = angular.copy(projectDefault)
		$scope.requirements = []

	$scope.create = ->
		payload =
			project:
				$scope.project
			requirements:
				$scope.requirements

		Project.create(payload).success((data) ->
			$scope.clearForm()
		)

	$scope.loadSubcategories = () ->
		RequirementSubcategory.getAll().success((data) ->
			for item in data
				$scope.subcategories.push({name: item.sub_category_name, id: item.id})
			)
		$scope.subcategories.push({name: 'Completed', id: 0})
		$scope.subcategories.push({name: 'In progress', id: 0})

	$scope.loadTags = () ->
		return $scope.subcategories


	$scope.open = ($event) ->
		$scope.opened = !$scope.opened


	$scope.loadSubcategories()



angular
	.module('dcsupp')
	.controller('CreateProjectCtrl', ['$scope', 'modalService', 'User', 'Project', 'RequirementCategory', 'RequirementSubcategory', controllerFunction])

