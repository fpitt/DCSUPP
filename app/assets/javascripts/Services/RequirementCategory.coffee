# ---------------------------------------------------------
# Service Function Calls: Requirement Category
#
# These are the server function calls for the requirement
# categories. We define the method, url and payload
# as services and call these methods using controller
# functions in the various folders.
# ---------------------------------------------------------
ServiceFunction = (requestService) ->

    #   create a requirement category
    #   payload format:
    #   requirement_category:
    #        category_name: String (category's name)
    create: (payload) ->
        sendParams=
            method: 'POST'
            url: '/requirement_categories.json'
        return requestService.service(sendParams, payload).success((data) ->
            return data)

    #   return 10 requirement categories
    #   used for Manage Category page to navigate through all categories
    #   payload format:
    #       direction: Integer (10 to go forward one page, -10 to go back one page)
    #       pagenumber: Integer (current page number)
    flip: (payload) ->
        sendParams =
            method: 'POST'
            url: '/get_categories.json'
        requestService.service(sendParams, payload)

    category: (payload) ->
        sendParams =
            method: 'POST'
            url: 'get_category.json'
        requestService.service(sendParams, payload)


angular
.module('dcsupp')
.service('RequirementCategory', ServiceFunction)

ServiceFunction.$injector = ['requestService']