ServiceFunction = (requestService) ->

    create: (payload) ->
        sendParams =
            url: '/projects.json'
            method: "POST"
        return requestService.service(sendParams, payload)

    patch: (id, payload) ->
        sendParams =
            url: '/projects/' + id + '.json'
            method: 'PATCH'
        return requestService.service(sendParams, payload)
    getAll: () ->
        return

    getById: (id) ->
        sendParams =
            url: '/projects/' + id + '.json'
            method: 'GET'

        return requestService.service(sendParams)

    getByCurrentUser: () ->
        sendParams =
            method: 'POST'
            url: '/get_projects_of_user.json'
        return requestService.service(sendParams)

    flip: (payload) ->
        sendParams =
            method: 'POST'
            url: '/flip_project_direction.json'

        requestService.service(sendParams, payload)

angular
.module('dcsupp')
.service('Project', ServiceFunction)
