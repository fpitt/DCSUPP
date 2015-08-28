ServiceFunction = (requestService) ->

    create: (payload) ->
        sendParams =
            url: '/references.json'
            method: 'POST'
        return requestService.service(sendParams, payload)

    getReferenceRequestsOfProfessor: () ->
        sendParams =
            url: '/get_reference_requests_of_professor.json'
            method: 'POST'

        return requestService.service(sendParams)

    processReferenceApproval: (payload) ->
        sendParams =
            url: '/process_reference_approval.json'
            method: 'POST'
        return requestService.service(sendParams, payload)

    addProfessorText: (payload) ->
        sendParams =
            url: 'add_professor_reference_text.json'
            method: 'POST'
        return requestService.service(sendParams, payload)

    getStudentApprovedByProjectApplication: (payload) ->
        sendParams =
            url: 'get_student_approved_by_project_application.json'
            method: 'POST'
        return requestService.service(sendParams, payload)


    getByProjectApplication: (payload) ->
        sendParams =
            url: 'get_by_project_application.json'
            method: 'POST'
        return requestService.service(sendParams, payload)
angular
.module('dcsupp')
.service('Reference', ServiceFunction)
