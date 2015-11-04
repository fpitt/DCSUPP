# ---------------------------------------------------------
# Page 3: Current Project
#
# This is the current projects page for the application. It
# lists the current projects students can apply for and it
# includes the requirements students will need to access.
# ---------------------------------------------------------

controllerFunction = ($scope, Project, RequirementSubcategory, $q) ->

	$scope.browse = true;
	$scope.projects = null;
	$scope.pagenumber = 1;
	$scope.direction = 0;

	# Change Browse
	$scope.project_browse = (input) ->
		$scope.browse = input

		if (input == false)
			$("#browse").removeClass("btn-primary").addClass("btn-default")
			$("#filter").addClass("btn-primary").removeClass("btn-default")
		else
			$("#filter").removeClass("btn-primary").addClass("btn-default")
			$("#browse").addClass("btn-primary").removeClass("btn-default")

	#	filter list of projects
	$scope.filterProjects = (tagsChanged, direction) ->
		if tagsChanged
			$scope.pagenumber = 1
			$scope.projects = null

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
	$scope.filterProjects(false, 0);


angular
.module('dcsupp')
.controller('CurrentProjectCtrl', ['$scope', 'Project', 
	'RequirementSubcategory','$q', controllerFunction])
