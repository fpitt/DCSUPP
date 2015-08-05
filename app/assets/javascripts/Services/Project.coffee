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
        return requestService.service(patchSendParams, payload)
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
        return requestService.service($scope.sendParams)

angular
.module('dcsupp')
.service('Project', ServiceFunction)
