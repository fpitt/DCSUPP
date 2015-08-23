ServiceFunction = (requestService) ->

    create: (payload) ->
        sendParams=
            method: 'POST'
            url: '/requirement_categories.json'

        return requestService.service(sendParams, payload).success((data) ->
            return data)

    patch: (id, payload) ->
        return

    getAll: () ->
        return

    getById: (id) ->
        return

    flip: (payload) ->
        sendParams =
            method: 'POST'
            url: '/get_categories.json'
        requestService.service(sendParams, payload)


angular
.module('dcsupp')
.service('RequirementCategory', ServiceFunction)
