# ---------------------------------------------------------
# Service Function Calls: Project Application
#
# These are the server function calls for the project applications.
# We define the method, url and payload
# as services and call these methods using controller
# functions in the various folders.
# ---------------------------------------------------------

ServiceFunction = (requestService, Upload) ->

    #   create new ProjectApplication object
    #   payload format:
    #       title: String
    #       message: String
    #       project: Integer
    #       requirements: [ list of requirement subcategories with their values filled in ]
    create: (payload) ->
        sendParams =
            url: '/project_applications.json'
            method: 'POST'
        return requestService.service(sendParams, payload)


    uploadResume: (payload) ->
        # Using ngFileUpload instead of requestService.
        return Upload.upload(
            url: '/upload_resume.json',
            method: 'POST',
            file: payload.file
            fields:
                application : payload.application
        )

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

    getProjectAssignments: () ->
        sendParams =
            method: 'POST'
            url: '/get_project_assignments.json'
        return requestService.service(sendParams);



angular
.module('dcsupp')
.service('ProjectApplication', ServiceFunction)
