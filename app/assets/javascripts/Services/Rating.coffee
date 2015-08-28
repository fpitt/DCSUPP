ServiceFunction = (requestService) ->

    create: (payload) ->
        sendParams =
            url: '/ratings.json'
            method: 'POST'
        return requestService.service(sendParams, payload)

    getRatingsOfStudent: (payload) ->
        sendParams =
            url: '/get_ratings_of_student.json'
            method: 'POST'
        return requestService.service(sendParams, payload)


angular
.module('dcsupp')
.service('Rating', ServiceFunction)
