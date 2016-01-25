
# ---------------------------------------------------------
# Single Page App: Entry Point
#
# This is the root defination for the DCSUPP app. The
# $stateProvider and URlRouter is defined here. The user
# permissions and roles are also defined in this file
#
# Future Note: Keep only initialization function in this file
# ---------------------------------------------------------

angular
.module('dcsupp', ['ui.bootstrap', 'ui.router', 'templates', 'permission', 'ngTagsInput', 'ngFileUpload'])
.config ['$stateProvider', '$urlRouterProvider', '$locationProvider', 
	($stateProvider, $urlRouterProvider, $locationProvider) -> 
		$urlRouterProvider.otherwise ($injector) ->
			$state = $injector.get("$state")
			$state.go('intro')
			return

		$locationProvider.html5Mode(true).hashPrefix('!')
	]

.run ['Permission', 'User', '$q', (Permission, User, $q) ->
	Permission.defineRole 'student', (stateParams) ->

		deferred = $q.defer()
			
		User.getUser()
			.then (data) ->
				if (!data.data.professor && !data.data.administrator)
					deferred.resolve(true)
				else
					deferred.reject(false)
				return
			.catch ->
				deferred.reject(false)

		return deferred.promise

	Permission.defineRole 'administrator', (stateParams) ->
		deferred = $q.defer()

		User.getUser()
			.then (data) ->
				if (data.data.administrator)
					deferred.resolve(true)
				else
					deferred.reject(false)
				return
			.catch ->
				deferred.reject(false)

		return deferred.promise

	Permission.defineRole 'professor', (stateParams) ->
		deferred = $q.defer()

		User.getUser()
			.then (data) ->
				if (data.data.professor)
					deferred.resolve(true)
				else
					deferred.reject(false)
				return
			.catch ->
				deferred.reject(false)
			
		return deferred.promise
]