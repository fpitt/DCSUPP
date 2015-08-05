controllerFunction = ($scope, requestService, $modal, modalService, Project) ->

	$scope.modalService = modalService

	# --- Page Variables ----

	$scope.pagenumber = 1
	$scope.projects = null
	$scope.direction = 0

	$scope.items = [
		'item1'
		'item2'
		'item3'
	]

	# --- Project Navigation ---

	$scope.loadProjcts = (pushDirection) ->
		payload = 
			direction: pushDirection
			pagenumber: $scope.pagenumber

		Project.flip().success((data) ->
			if (data)
				$scope.projects = data
				if $scope.direction > 0
					$scope.pagenumber += 1
				else if $scope.direction < 0
					$scope.pagenumber -= 1
				else
					$scope.pagenumber = 1)

	# --- JQuery Initialization Code ---

	$('[data-toggle="tooltip"]').tooltip()
	$scope.loadProjects(0)

angular
.module('dcsupp')
.controller('CurrentProjectCtrl', ['$scope', 'requestService', '$modal', 'modalService', 'Project', controllerFunction])
