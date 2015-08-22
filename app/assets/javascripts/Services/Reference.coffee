ServiceFunction = (requestService) ->

    create: (payload) ->
        sendParams =
            url: '/refe.json'
            method: 'POST'
        return requestService.service(sendParams, payload)



angular
.module('dcsupp')
.service('Reference', ServiceFunction)
