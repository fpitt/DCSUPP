# ---------------------------------------------------------
# Service Module: Request Service
#
# This module is intended to be used globally by all functions
# called in $http call functions inside angular controllers.
# 
# The request method, url, and data and added as functions
# ---------------------------------------------------------

ServiceFunction = ($http) ->

	service: (sendParams, autopayload = []) ->

		request =
			method: sendParams.method
			url: sendParams.url
			headers:
				'X-CSRF-Token': $('meta[name="csrf-token"]').attr('content')
			data:
				payload: autopayload

		return $http(request)


angular
	.module('dcsupp')
	.service('requestService', ServiceFunction)
