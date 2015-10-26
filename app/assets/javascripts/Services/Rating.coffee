# ---------------------------------------------------------

# NOT BEING USED IN APPLICATION

# Service Function Calls: Rating
#
# These are the server function calls for the ratings.
# We define the method, url and payload
# as services and call these methods using controller
# functions in the various folders.
# ---------------------------------------------------------
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
