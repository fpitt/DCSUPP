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
    #       title: String (project application title)
    #       message: String (project application message)
    #       project: Integer (project id)
    #       requirements: [ list of requirement subcategories with their values filled in ]
    create: (payload) ->
        sendParams =
            url: '/project_applications.json'
            method: 'POST'
        return requestService.service(sendParams, payload)

    #   attach resume to project application
    #   payload format:
    #       file: File Object (pdf resume)
    #       application: Integer (project application id)
    uploadResume: (payload) ->
        # Using ngFileUpload instead of requestService.
        return Upload.upload(
            url: '/upload_resume.json',
            method: 'POST',
            file: payload.file
            fields:
                application : payload.application
        )

    #   get project application by its id
    #   id: Integer (project application id)
    getById: (id) ->
        sendParams =
            url: '/project_applications/' + id + '.json'
            method: 'GET'

        return requestService.service(sendParams)

    #   get all project applications belonging to current user
    getByCurrentUser: () ->
        sendParams =
            method: 'POST'
            url: '/get_applications_of_user.json'
        return requestService.service(sendParams)

    #   get all project applications for a project
    getByProject: (payload) ->
        sendParams =
            method: 'POST'
            url: '/get_applications_of_project.json'
        return requestService.service(sendParams, payload)

    #   save current user's decision to reject/accept project application
    #   used by student to accept offer of position, professors to accept offers,
    #   and admins to approve student-professor project assignments
    #   payload format:
    #       approved: Boolean (true for accept, false for reject)
    #       application: Integer (id of application)
    processOffer: (payload) ->
        sendParams =
            method: 'POST'
            url: '/process_offer.json'

        return requestService.service(sendParams, payload)

    #   get all project assignments
    getProjectAssignments: () ->
        sendParams =
            method: 'POST'
            url: '/get_project_assignments.json'
        return requestService.service(sendParams);

    #   get all project assignments requiring admin approval
    getRequireAdministratorApprovalAssignments: () ->
        sendParams =
            method: 'POST'
            url: '/get_require_administrator_approval_applications.json'
        return requestService.service(sendParams)

    ###
    get a page of project applications
    payload format:
        pagenumber: Integer (current pagenumber)
        direction: Integer (-10 to go back one page, 10 to go forward one page)
    ###
    flipApplicationsOfUser: (payload) ->
    flipApplicationsOfUser: (payload) ->
        sendParams =
            method: 'POST'
            url: '/flip_applications_of_user.json'
        return requestService.service(sendParams, payload)


angular
.module('dcsupp')
.service('ProjectApplication', ServiceFunction)

ServiceFunction.$injector = ['requestService', 'Upload']