ServiceFunction = (requestService) ->

    create: (payload) ->
        sendParams=
            method: 'POST'
            url: '/requirement_subcategories.json'

        return requestService.service(sendParams, payload)

    patch: (id, payload) ->
        return

    getAll: (payload) ->
        sendParams =
            method: 'POST'
            url: '/get_subcategories.json'
        requestService.service(sendParams, payload)

    getById: (id) ->
        return
angular
.module('dcsupp')
.service('RequirementSubcategory', ServiceFunction)
