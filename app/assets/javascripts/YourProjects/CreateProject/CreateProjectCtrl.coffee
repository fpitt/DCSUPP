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

controllerFunction = ($scope, User, Project, RequirementCategory, RequirementSubcategory, $state, $q) ->
	#	pop-up service for page settings + information

	#	project form information
	$scope.project = {}
	#	required student attributes of this project
	$scope.requirement_list =  []
	#	Project Requirement
	$scope.project_requirement = 
		attribute_type: "Number"
		value_number: null
		value_date: new Date()
		value_boolean: false
		value_input: ""
		comparison: "None"
		name: ""
		category_id: null
	#	Default Empty
	$scope.project_requirement_empty = 
		attribute_type: "Number"
		value_number: null
		value_date: new Date()
		value_boolean: false
		value_input: ""
		comparison: "None"
		name: ""
		category_id: null

	# --- Search Requirement Category ---
	#	Requirement Input
	$scope.requirement_input = ""
	#	Requirement Input Error
	$scope.requirement_input_error = ""

	#	Add Requirement Category
	$scope.addCategory = ->
		if (!$scope.validateInput())
			console.log("false")
			return false

		#Check if the Input Exists
		if ($scope.requirement_input && $scope.requirement_input.id)
			#Set the project requirement variables
			$scope.project_requirement.name = $scope.requirement_input.sub_category_name
			$scope.project_requirement.category_id = $scope.requirement_input.id
			$scope.requirement_list.push($scope.project_requirement)

			#Reset the input states
			$scope.project_requirement = angular.copy($scope.project_requirement_empty)
			$scope.requirement_input = ""
			$scope.requirement_input_error = ""
		else
			$scope.requirement_input_error = "Please select a Requirement SubCategory"

	#Validate Input
	$scope.validateInput = ->
		if ($scope.requirement_input.attribute_type == 'Number' && $scope.project_requirement.value_number == null)
			$scope.requirement_input_error = "Input Number Cannot be Null"
			return false

		return true

	#	Remove Category from Array
	$scope.removeCategory = (category) ->
		index = 0
		for requirement in $scope.requirement_list
			if requirement.category_id == category.category_id
				$scope.requirement_list.splice(index, 1)
			index = index + 1

	#	create the project
	$scope.createProject = ->
		Project.create($scope.project, $scope.requirement_list)
		.success (data) ->
			# redirect to new page once project has been successfully added
			$state.go('your_projects.project_info', {id: data.id})
			# display updated list in parent state
			$scope.getInProgressProjects()
		.error (data) ->
			$scope.error = true

	#   get all professors with names matching keyword "name"
	$scope.getSubCategories = (name) ->
		deferred = $q.defer()
		User.getSubCategoryContainingKeyword(subcategory: name).success (data) ->
            deferred.resolve(data)
        return deferred.promise

    $('.collapse').collapse()	

angular
	.module('dcsupp')
	.controller('CreateProjectCtrl', ['$scope', 'User', 'Project', 
		'RequirementCategory', 'RequirementSubcategory', '$state', '$q', controllerFunction])

