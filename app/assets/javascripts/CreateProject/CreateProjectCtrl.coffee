controllerFunction = ($scope, requestService, modalService, User) ->
	$scope.modalService = modalService
	$scope.opened = false

	$scope.project =
		title: ""
		text: ""
	$scope.projectDefault =
		title: ""
		text: ""
	$scope.sendParams =
		url: '/projects.json'
		method: "POST"

	successFunction = (data) ->
		console.log("Created Project")
		clearForm()


	clearForm = ->
		$scope.project = angular.copy($scope.projectDefault)


	$scope.create = ->
		$scope.payload =
			project:
				title: $scope.project.title
				text: $scope.project.text
				date: $scope.project.deadline

		requestService.service($scope.sendParams, $scope.payload).success(successFunction)

	$('[data-toggle="tooltip"]').tooltip()

	$scope.today = ->
		$scope.dt = new Date
		return

	$scope.today()

	$scope.clear = ->
		$scope.dt = null
		return

	# Disable weekend selection

	$scope.disabled = (date, mode) ->
		mode == 'day' and (date.getDay() == 0 or date.getDay() == 6)

	$scope.toggleMin = ->
		$scope.minDate = if $scope.minDate then null else new Date
		return

	$scope.toggleMin()

	$scope.open = ($event) ->
		$scope.opened = true
		return

	$scope.dateOptions =
		formatYear: 'yy'
		startingDay: 1
	$scope.formats = [
		'dd-MMMM-yyyy'
		'yyyy/MM/dd'
		'dd.MM.yyyy'
		'shortDate'
	]

	$scope.format = $scope.formats[0]
	tomorrow = new Date
	tomorrow.setDate tomorrow.getDate() + 1
	afterTomorrow = new Date
	afterTomorrow.setDate tomorrow.getDate() + 2
	$scope.events = [
		{
			date: tomorrow
			status: 'full'
		}
		{
			date: afterTomorrow
			status: 'partially'
		}
	]

	$scope.getDayClass = (date, mode) ->
		if mode == 'day'
			dayToCheck = new Date(date).setHours(0, 0, 0, 0)
			i = 0
			while i < $scope.events.length
				currentDay = new Date($scope.events[i].date).setHours(0, 0, 0, 0)
				if dayToCheck == currentDay
					return $scope.events[i].status
				i++





angular
	.module('dcsupp')
	.controller('CreateProjectCtrl', ['$scope', 'requestService', 'modalService', 'User', controllerFunction])

