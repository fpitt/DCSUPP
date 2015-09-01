# -------------------------------------------------------------------------------------------------------
# Page: Create Project Page
#
# Summary:
# This is the Create Project for DCSUPP. It allows professors to add research project
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
	$scope.modalService = modalService
	$scope.project = {}
	$scope.project.requirements =  []

	# create the project
	$scope.createProject = ->
		Project.create($scope.project)
		.success((data) ->
			# redirect to new page once project has been successfully added
			$state.go('your_projects.project_info', {id : data.id})
		)

	# load the requirement subcategories that match what the user has entered.
	$scope.loadTags = (query) ->
		deferred = $q.defer();
		RequirementSubcategory.RequirementSubcategoriesWithKeyword(keyword : query)
		.success((data) ->
			deferred.resolve(data.map((val) ->
				name : val.sub_category_name
				id : val.id
			)))
		return deferred.promise

angular
	.module('dcsupp')
	.controller('CreateProjectCtrl', ['$scope', 'modalService', 'User', 'Project', 'RequirementCategory', 'RequirementSubcategory', '$state', '$q', controllerFunction])

