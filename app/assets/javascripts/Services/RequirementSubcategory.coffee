ServiceFunction = (requestService) ->

    create: (payload) ->
        sendParams=
            method: 'POST'
            url: '/requirement_subcategories.json'

        return requestService.service(sendParams, payload)

    patch: (id, payload) ->
        return

    getAllOfCategory: (payload) ->
        sendParams =
            method: 'POST'
            url: '/get_subcategories.json'
        requestService.service(sendParams, payload)

    getAll: () ->
        sendParams =
            method: 'POST'
            url: '/get_all_subcategories.json'
        requestService.service(sendParams)

    getById: (id) ->
        sendParams =
            method: 'GET'
            url: '/requirement_subcategories/' + id + '.json'
        requestService.service(sendParams)


angular
.module('dcsupp')
.service('RequirementSubcategory', ServiceFunction)
