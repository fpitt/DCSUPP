
# ---------------------------------------------------------
# Single Page App: Entry Point
#
# This is the root defination for the DCSUPP app. The
# $stateProvider and URlRouter is defined here. The user
# permissions and roles are also defined in this file
#
# Future Note: Keep only initialization function in this file
# ---------------------------------------------------------

configFunction = ($stateProvider, $urlRouterProvider, $locationProvider) -> 
	$urlRouterProvider.otherwise ($injector) ->
		$state = $injector.get("$state")
		$state.go('intro')
		return

	$locationProvider.html5Mode(true).hashPrefix('!')


runFunction = (Permission, User, $q) ->
	User.getUser().success (data) ->
		if (!data.professor && !data.administrator)
			User.role = 'student'
		else if (data.professor && !data.administrator)
			User.role = 'professor'
		else if (data.administrator)
			User.role = 'administrator'
		else 
			User.role = 'anonymous'

	deferred = $q.defer()

	Permission
		.defineRole 'student', (stateParams) ->
			User.getUser().then(studentSuccess, globalFailure)
			return deferred.promise

		.defineRole 'administrator', (stateParams) ->
			User.getUser().then(administratorSuccess, globalFailure)
			return deferred.promise

		.defineRole 'professor', (stateParams) ->
			User.getUser().then(professorSuccess, globalFailure)
			return deferred.promise

		.defineRole 'anonymous', (stateParams) ->
			User.getUser().then(anomymousSuccess, globalFailure)
			return deferred.promise


	# ---- Global Failure ----
	globalFailure = ->
		deferred.reject(false)
		return

	# ---- Anonymous Functions ----
	anomymousSuccess = (data) ->
		if (!data.data.id)
			deferred.resolve(true)
		else
			deferred.reject(false)
		return

	# ---- Professor Functions ----
	professorSuccess = (data) ->
		if (data.data.professor && !data.data.administrator)
			deferred.resolve(true)
		else
			deferred.reject(false)
		return

	# ---- Administrator Function ---
	administratorSuccess = (data) ->
		if (data.data.administrator)
			deferred.resolve(true)
		else
			deferred.reject(false)
		return

	# ---- Professor Funcion ---
	studentSuccess = (data) ->
		if (!data.data.professor && !data.data.administrator)
			deferred.resolve(true)
		else
			deferred.reject(false)
		return


angular
	.module('dcsupp', ['ui.bootstrap', 'ui.router', 'templates', 'permission'])
	.config(['$stateProvider', '$urlRouterProvider', '$locationProvider', configFunction])
	.run(runFunction)