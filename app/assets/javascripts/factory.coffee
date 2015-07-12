ServiceFunction = ($http) ->

	flipSuccess = (data) ->
		return data

	callAngular: (method, data, url) ->

		request = 
            method: 'POST',
            url: sendParams.url,
            headers:
            	'X-CSRF-Token': $('meta[name="csrf-token"]').attr('content')
            data: 
            	pageNumber: sendParams.pageNumber
            	direction: direction

        return $http(request)


angular
	.module('dcsupp')
	.service('requestService', ServiceFunction)

