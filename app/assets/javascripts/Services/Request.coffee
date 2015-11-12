# -------------------------------------------------------------------------------------------------------
# requestService is a service for making GET, POST, and PATCH requests to the server.
#
# You can make a request by calling requestService.service(sendParams, [ payload ]).
# sendParams format:
#	url: String representing endpoint, also specify return type, currently all of our
# 	requests return json objects. Example url:  "projects.json"
#	method: String representing type of request, i.e. "GET", "POST", "PATCH"
# autopayload: an optional Javascript object to include in the request body.
# -------------------------------------------------------------------------------------------------------
angular
	.module('dcsupp')
	.service 'requestService', ['$http', ($http) ->

		#	make a request
		service: (sendParams, autopayload = []) ->

			request =
				method: sendParams.method
				url: sendParams.url
				headers:
					'X-CSRF-Token': $('meta[name="csrf-token"]').attr('content')
				data:
					payload: autopayload

			return $http(request)
	]