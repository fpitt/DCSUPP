controllerFunction = ($scope, $modal, modalService, Project) ->

	$scope.modalService = modalService
	$scope.projects = null
	$scope.direction = 0
	$scope.filter = 'In progress'

	$scope.items = [
		'item1'
		'item2'
		'item3'
	]
	$scope.pagenumber = {current: 0, completed: 0, inProgress: 0}

	$scope.flipInProgress = (pushDirection) ->
		payload =
			direction: pushDirection
			pagenumber: $scope.pagenumber.inProgress
		$scope.direction = pushDirection

		Project.flipInProgress(payload).success((data) ->
			if (data)
				$scope.projects = data
				if $scope.direction > 0
					$scope.pagenumber.inProgress += 1
				else if $scope.direction < 0
					$scope.pagenumber.inProgress -= 1
				else
					$scope.pagenumber.inProgress = 1

				$scope.pagenumber.current = $scope.pagenumber.inProgress
		)

	$scope.flipCompleted = (pushDirection) ->
		payload =
			direction: pushDirection
			pagenumber: $scope.pagenumber.completed
		$scope.direction = pushDirection

		Project.flipCompleted(payload).success((data) ->
			if (data)
				$scope.projects = data
				if $scope.direction > 0
					$scope.pagenumber.completed += 1
				else if $scope.direction < 0
					$scope.pagenumber.completed -= 1
				else
					$scope.pagenumber.completed = 1
				$scope.pagenumber.current = $scope.pagenumber.inProgress
		)

	# --- JQuery Initialization Code ---

	$('[data-toggle="tooltip"]').tooltip()
	$scope.flipInProgress(10)


angular
.module('dcsupp')
.controller('CurrentProjectCtrl', ['$scope',  '$modal', 'modalService', 'Project', controllerFunction])
