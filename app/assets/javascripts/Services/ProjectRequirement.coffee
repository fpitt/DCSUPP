# ---------------------------------------------------------
# Service Function Calls: Project Requirement
#
# These are the server function calls for the project requirements.
# We define the method, url and payload
# as services and call these methods using controller
# functions in the various folders.
# ---------------------------------------------------------
angular
.module('dcsupp')
.service 'ProjectRequirement', ['requestService', (requestService) ->

    #   get all project requirements for a given project
    #   payload format:
    #       project: Integer (project id)
    getByProject: (payload) ->
        sendParams =
            method: 'POST'
            url: '/get_requirements_of_project.json'
        return requestService.service(sendParams, payload)
    ]