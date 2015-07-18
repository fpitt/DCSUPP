ServiceFunction = (requestService, $cookies)->
    auth = {}
    auth.storeToken = (token)->
        $cookies.push('userToken', token)

    auth.getToken = () ->
        $cookies.get('userToken')
angular
.module('dcsupp')
.service('authService', ServiceFunction)
