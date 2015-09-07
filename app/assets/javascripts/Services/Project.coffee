# ---------------------------------------------------------
# Service Function Calls: Projects
#
# These are the server function calls for the projects.
# We define the method, url and payload
# as services and call these methods using controller
# functions in the various folders.
# ---------------------------------------------------------


ServiceFunction = (requestService) ->

    #   create a new Project object
    #   payload format:
    #       title: String (title of project)
    #       text: String (project description)
    #       deadline_date: Date Object (application submission deadline)
    #       requirements: [ list of requirement subcategories ]
    #       details: [ list of non student attribute requirement subcategories ]
    create: (payload) ->
        sendParams =
            url: '/projects.json'
            method: "POST"
        return requestService.service(sendParams, payload)


    #   update a Project object
    #   id: Integer (id of project)
    #   payload format:
    #       title: String (title of project)
    #       text:   String (project description)
    #       deadline_date: Date Object (application submission deadline)
    #       requirementsL [ list of requirement subcategories ]
    patch: (id, payload) ->
        sendParams =
            url: '/projects/' + id + '.json'
            method: 'PATCH'
        return requestService.service(sendParams, payload)

    #   get a Project by its id
    #   id: Integer (id of project)
    getById: (id) ->
        sendParams =
            url: '/projects/' + id + '.json'
            method: 'GET'

        return requestService.service(sendParams)

    #   get all Projects belonging to the current user
    #   only professors (and admins, for testing purposes) have access to this function
    getByCurrentUser: () ->
        sendParams =
            method: 'POST'
            url: '/get_projects_of_user.json'
        return requestService.service(sendParams)


    filterProjects: (payload) ->
        sendParams =
            method: 'POST'
            url: '/filter_projects.json'
        requestService.service(sendParams, payload)

    getInProgressProjectsOfCurrentUser: () ->
        sendParams =
            method: 'POST'
            url: 'get_in_progress_projects_of_current_user.json'
        return requestService.service(sendParams)

    getCompletedProjectsOfCurrentUser: () ->
        sendParams =
            method: 'POST'
            url: 'get_completed_projects_of_current_user.json'
        return requestService.service(sendParams)
#
#
#    flip: (payload) ->
#        sendParams =
#            method: 'POST'
#            url: '/flip_project_direction.json'
#
#        requestService.service(sendParams, payload)
#
#    flipInProgress: (payload) ->
#        sendParams =
#            method: 'POST'
#            url: '/flip_in_progress_direction.json'
#        requestService.service(sendParams, payload)
#
#    flipCompleted: (payload) ->
#        sendParams =
#            method: 'POST'
#            url: '/flip_completed_direction.json'
#        requestService.service(sendParams, payload)

    #   mark a Project as being completed
    #   payload format:
    #       project: Integer (id of project)
    setCompleted: (payload) ->
        sendParams =
            method: 'POST'
            url: '/set_project_completed.json'
        requestService.service(sendParams, payload)

angular
.module('dcsupp')
.service('Project', ServiceFunction)
