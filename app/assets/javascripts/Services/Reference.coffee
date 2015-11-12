# ---------------------------------------------------------
# Service Function Calls: Reference
#
# These are the server function calls for the references.
# We define the method, url and payload
# as services and call these methods using controller
# functions in the various folders.
# ---------------------------------------------------------
angular
.module('dcsupp')
.service 'Reference', ['requestService', (requestService) ->

    #   create a reference request
    #   payload format:
    #       student_text: String (student's message to professor)
    #       application: Integer (project application id)
    #       professor:  Integer (professor id)
    create: (payload) ->
        sendParams =
            url: '/references.json'
            method: 'POST'
        return requestService.service(sendParams, payload)

    #   get all pending reference requests for the current user
    getReferenceRequestsOfProfessor: () ->
        sendParams =
            url: '/get_reference_requests_of_professor.json'
            method: 'POST'

        return requestService.service(sendParams)

    #   save current user's decision to use reference (if student) or
    #   accept a reference request (if professor)
    #   payload format:
    #       reference: Integer (reference request id)
    #       approved: Boolean (true for accept, false for reject)
    processReferenceApproval: (payload) ->
        sendParams =
            url: '/process_reference_approval.json'
            method: 'POST'
        return requestService.service(sendParams, payload)

    #   add professor's message to a project application
    #   payload format:
    #       professor_text: String (professor's message)
    addProfessorText: (payload) ->
        sendParams =
            url: 'add_professor_reference_text.json'
            method: 'POST'
        return requestService.service(sendParams, payload)

    #   get all student approved reference for a project application
    #   payload format:
    #       application: Integer (project application id)
    getStudentApprovedByProjectApplication: (payload) ->
        sendParams =
            url: 'get_student_approved_by_project_application.json'
            method: 'POST'
        return requestService.service(sendParams, payload)

    #   get all references for a project application
    #   payload format:
    #       application: Integer (project application id)
    getByProjectApplication: (payload) ->
        sendParams =
            url: 'get_by_project_application.json'
            method: 'POST'
        return requestService.service(sendParams, payload)
    ]