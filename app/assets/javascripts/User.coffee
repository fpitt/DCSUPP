ServiceFunction = (requestService) ->

    getUser = ->
        sendParams =
            url: '/current_user.json'
            method: "GET"

        requestService.service(sendParams).success(successFunction)

    successFunction = (data) ->
        return data


    getAccessLevel: ->
        return getUser().accessLevel

angular
.module('dcsupp')
.service('User', ServiceFunction)
