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
