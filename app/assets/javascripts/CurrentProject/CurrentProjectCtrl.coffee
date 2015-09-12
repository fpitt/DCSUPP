# ---------------------------------------------------------
# Page 3: Current Project
#
# This is the current projects page for the application. It
# lists the current projects students can apply for and it
# includes the requirements students will need to access.
# ---------------------------------------------------------

controllerFunction = ($scope, modalService, Project, RequirementSubcategory, $q) ->

	$scope.modalService = modalService
	$scope.projects = null

	$scope.filter = 'In progress'
	$scope.subcategories = []
	$scope.requirements = []

	$scope.pagenumber = 1;
	$scope.direction = 0

	#	get Project filter tags by keyword
	$scope.loadTags = (query) ->
		deferred = $q.defer();
		RequirementSubcategory.studentAttributeRequirementSubcategoriesWithKeyword(keyword: query)
		.success((data) ->
			tags = data.map((val) ->
				name: val.sub_category_name
				id: val.id)
			if 'in progress'.indexOf(query.toLowerCase()) != -1
				tags.push({name: 'In progress', id:'0'})
			else if 'completed'.indexOf(query.toLowerCase()) != -1
				tags.push({name: 'Completed', id:'0'})
			deferred.resolve(tags))
		return deferred.promise

	#	filter list of projects
	$scope.filterProjects = (tagsChanged, direction) ->
		if tagsChanged
			$scope.pagenumber = 0

		Project.filterProjects(
			pagenumber: $scope.pagenumber
			filter: $scope.requirements
			direction: direction
		).success((data) ->
			if (data)
				$scope.projects = data
				if direction > 0
					$scope.pagenumber += 1
				else if direction < 0
					$scope.pagenumber -= 1
				else
					$scope.pagenumber = 1
		)


	# --- JQuery Initialization Code ---

	$('[data-toggle="tooltip"]').tooltip()
#	$scope.loadSubcategories()
	$scope.filterProjects(false, 0);


angular
.module('dcsupp')
.controller('CurrentProjectCtrl', ['$scope', 'modalService', 'Project', 'RequirementSubcategory','$q', controllerFunction])
