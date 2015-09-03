# ---------------------------------------------------------
# Service Function Calls: User
#
# These are the server function calls for the users.
# We define the method, url and payload
# as services and call these methods using controller
# functions in the various folders.
# ---------------------------------------------------------
ServiceFunction = (requestService) ->

    #   get the current user
    getUser : ->
        sendParams =
            url: '/current_user.json'
            method: 'POST'
        requestService.service(sendParams)

    #   get a user by id
    #   id: Integer (user id)
    getById : (id) ->
        sendParams =
            url: '/users/' + id + '.json'
            method: 'GET'
        requestService.service(sendParams)

    flipProfessors : (payload) ->
        sendParams =
            url: '/flip_professor_direction.json'
            method: 'POST'
        requestService.service(sendParams, payload)

    #   get all professors whose name contains keyword
    #   payload format:
    #       keyword: String (search term)
    getProfessorContainingKeyword : (payload) ->
        sendParams =
            url: '/get_professor_containing_keyword.json'
            method: 'POST'
        requestService.service(sendParams, payload)

angular.module('dcsupp').service('User', ServiceFunction)

