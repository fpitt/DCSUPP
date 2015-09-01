ServiceFunction = (requestService) ->

    getUser : ->
        sendParams = undefined
        sendParams =
            url: '/current_user.json'
            method: 'POST'
        requestService.service(sendParams)

#    getAccessLevel : ->
#        getUser().then (data) ->
#            data

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

    getStudents : ->

    getProfessorByName : (payload) ->
        sendParams =
            url: '/get_professor_by_name.json'
            method: 'POST'
        requestService.service(sendParams, payload)

#    patchUser : (payload) ->

angular.module('dcsupp').service('User', ServiceFunction)

