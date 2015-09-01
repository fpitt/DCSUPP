
# ---------------------------------------------------------
# Service Function Calls: Requirement Subcategories
#
# These are the server function calls for the requirement
# subcategories. We define the method, url and payload
# as services and call these methods using controller
# functions in the various folders.
# ---------------------------------------------------------


ServiceFunction = (requestService) ->

    create: (payload) ->
        sendParams=
            method: 'POST'
            url: '/requirement_subcategories.json'

        return requestService.service(sendParams, payload)

    patch: (id, payload) ->
        return

    getAllOfCategory: (payload) ->
        sendParams =
            method: 'POST'
            url: '/get_subcategories.json'
        requestService.service(sendParams, payload)

    getAll: () ->
        sendParams =
            method: 'POST'
            url: '/get_all_subcategories.json'
        requestService.service(sendParams)

    getById: (id) ->
        sendParams =
            method: 'GET'
            url: '/requirement_subcategories/' + id + '.json'
        requestService.service(sendParams)


    # Get all subcategories with name containing given string.
    # payload format:
    #   keyword : String
    RequirementSubcategoriesWithKeyword: (payload) ->
        sendParams =
            method: 'POST'
            url: 'requirement_subcategories_with_keyword.json'
        requestService.service(sendParams, payload)


angular
.module('dcsupp')
.service('RequirementSubcategory', ServiceFunction)
