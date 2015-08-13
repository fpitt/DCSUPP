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
        sendParams =
            method: 'POST'
            url: '/get_applications_of_user.json'
        return requestService.service(sendParams)

    getByProject: (payload) ->
        sendParams =
            method: 'POST'
            url: '/get_applications_of_project.json'
        return requestService.service(sendParams, payload)


    processOffer: (payload) ->
        sendParams =
            method: 'POST'
            url: '/process_offer.json'

        return requestService.service(sendParams, payload)

angular
.module('dcsupp')
.service('ProjectApplication', ServiceFunction)
