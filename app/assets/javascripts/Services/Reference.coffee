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

    AddProfessorText: (payload) ->
        sendParams =
            url: 'add_professor_reference_text.json'
            method: 'POST'
        return requestService.service(sendParams, payload)




angular
.module('dcsupp')
.service('Reference', ServiceFunction)
