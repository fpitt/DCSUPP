ServiceFunction = (requestService)->
    successFunction = (data) ->
        return data


    auth.getUser = (userId)->
        sendParams =
            url: '/users/' + userId
            method: 'GET'

        requestService.service(sendParams).success(successFunction)


    return auth

angular
.module('dcsupp')
.service('authService', ServiceFunction)
