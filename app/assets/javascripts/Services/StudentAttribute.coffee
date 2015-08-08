ServiceFunction = (requestService) ->

    create: (payload) ->
        return

    patch: (id, payload) ->
        return

    getAll: () ->
        return

    getById: (id) ->
        return

    getByCurrentUser: () ->
        sendParams =
            method: 'POST'
            url: '/get_projects_of_user.json'
        return requestService.service(sendParams)

    getBySubcategoryAndCurrentUser: (payload) ->
        sendParams =
            method: 'POST'
            url: '/get_attribute_of_user_and_subcategory.json'
        return requestService.service(sendParams, payload)



angular
.module('dcsupp')
.service('Project', ServiceFunction)
