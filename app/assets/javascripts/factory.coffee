ServiceFunction = ($http) ->

	flipSuccess = (data) ->
		console.log(data)

	flip: (direction, sendParams) ->

		request = 
            method: 'POST',
            url: sendParams.url,
            headers:
            	'X-CSRF-Token': $('meta[name="csrf-token"]').attr('content')
            data: 
            	pageNumber: sendParams.pageNumber
            	direction: direction

        $http(request).success(flipSuccess)


angular
	.module('dcsupp')
	.service('requestService', ServiceFunction)

