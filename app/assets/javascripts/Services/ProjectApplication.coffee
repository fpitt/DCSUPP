ServiceFunction = (requestService) ->

    create: (payload) ->
        sendParams =
            url: '/project_applications.json'
            method: 'POST'
        return requestService.service(sendParams, payload)

    patch: (id, payload) ->
        return

    getAll: () ->
        return

    getById: (id) ->
        sendParams =
            url: '/project_applications/' + id + '.json'
            method: 'GET'

        return requestService.service(sendParams)

    getByCurrentUser: () ->
        endParams =
            method: 'POST'
            url: '/get_applications_of_user.json'
        return requestService.service(sendParams)

angular
.module('dcsupp')
.service('ProjectApplication', ServiceFunction)
