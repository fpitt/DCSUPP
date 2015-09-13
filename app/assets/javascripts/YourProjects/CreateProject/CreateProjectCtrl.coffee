# -------------------------------------------------------------------------------------------------------
# Page: Create Project Page
#
# Summary:
# This is the Create Project page for DCSUPP. It allows professors to add research project
# opportunities. Professor can also add additional attributes to the project
# such as specifying that the position is a volunteer position, and requirements
# for the project application such as a particular course grade (this is done by
# adding a tag in the "Requirement Categories" field. For the complete list
# requirement categories, visit the "Manage Categories" page.
#
# Page Placement [Referred to in the Comments]:
#
# [Top-right]
# Popup button, displays the Information and Settings Popup menus.
# -------------------------------------------------------------------------------------------------------

controllerFunction = ($scope, modalService, User, Project, RequirementCategory, RequirementSubcategory, $state, $q) ->
	#	pop-up service for page settings + information
	$scope.modalService = modalService

	#	project form information
	$scope.project = {}
	#	required student attributes of this project
	$scope.project.requirements =  []
	#	additional details of this project (default details are title, supervisor, deadline, description)
	$scope.project.details = []

	#	create the project
	$scope.createProject = ->
		Project.create($scope.project)
		.success((data) ->
			# redirect to new page once project has been successfully added
			$state.go('your_projects.project_info', {id: data.id})

			# display updated list in parent state
			$scope.getInProgressProjects()
		)

	#	add additional detail to project
	$scope.addDetail = ->
		#	disallow duplicate detail items in list
		if !$scope.containedInDetails($scope.detailSelected)
			$scope.project.details.push($scope.detailSelected)

	#	check if given detail is already in list
	$scope.containedInDetails = (detail) ->
		for detailItem in $scope.project.details
			if detailItem.name == detail.name
				return true
		return false

	#	load non student attribute subcategories with name that contains viewValue for typeahead
	$scope.loadDetails = (viewValue) ->
		deferred = $q.defer();
		RequirementSubcategory.nonStudentAttributeRequirementSubcategoriesWithKeyword(keyword: viewValue)
		.success((data) ->
			deferred.resolve(data.map((val) ->
				name: val.sub_category_name
				id: val.id
				attribute_type: val.attribute_type
			)))
		return deferred.promise


	#	load the student attribute requirement subcategories with name that contains query for ng-tags-input.
	$scope.loadTags = (query) ->
		deferred = $q.defer();
		RequirementSubcategory.studentAttributeRequirementSubcategoriesWithKeyword(keyword: query)
		.success((data) ->
			deferred.resolve(data.map((val) ->
				name: val.sub_category_name
				id: val.id
				attribute_type: val.attribute_type
			)))
		return deferred.promise

angular
	.module('dcsupp')
	.controller('CreateProjectCtrl', ['$scope', 'modalService', 'User', 'Project', 'RequirementCategory', 'RequirementSubcategory', '$state', '$q', controllerFunction])

