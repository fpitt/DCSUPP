ServiceFunction = (requestService) ->

    get: () ->
        return

    getById: (id) ->
        return

    getByProject: (payload) ->
        sendParams =
            method: 'POST'
            url: '/get_requirements_of_project.json'
        return requestService.service(sendParams, payload)


angular
.module('dcsupp')
.service('ProjectRequirement', ServiceFunction)
