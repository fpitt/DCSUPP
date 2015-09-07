
# ---------------------------------------------------------
# Service Function Calls: Requirement Subcategories
#
# These are the server function calls for the requirement
# subcategories. We define the method, url and payload
# as services and call these methods using controller
# functions in the various folders.
# ---------------------------------------------------------


ServiceFunction = (requestService) ->

    #   create a new requirement subcategory
    #   payload format:
    #       subcategory:
    #           sub_category_name: String
    #           attribute_type: String
    #           upper_limit: Integer
    #           lower_limit: Integer
    #           regex: String
    #           placeholder: String
    #           student_attribute: Boolean
    #       target_id: Integer
    create: (payload) ->
        sendParams=
            method: 'POST'
            url: '/requirement_subcategories.json'

        return requestService.service(sendParams, payload)

    #   get all subcategories that belong to a given category
    #   payload format:
    #       target_id: id (category id)
    patch: (id, payload) ->
        return

    update: (id, payload) ->
        sendParams=
            method: 'PATCH'
            url: '/requirement_subcategories/' + id + '.json'

        return requestService.service(sendParams, payload)

    getAllOfCategory: (payload) ->
        sendParams =
            method: 'POST'
            url: '/get_subcategories.json'
        requestService.service(sendParams, payload)

    #   get all subcategories
    getAll: () ->
        sendParams =
            method: 'POST'
            url: '/get_all_subcategories.json'
        requestService.service(sendParams)

    #   get subcategory by id
    #   id: Integer (subcategory id)
    getById: (id) ->
        sendParams =
            method: 'GET'
            url: '/requirement_subcategories/' + id + '.json'
        requestService.service(sendParams)

    #   Get all student attribute subcategories with name containing given string.
    #   payload format:
    #       keyword: String (search term)
    studentAttributeRequirementSubcategoriesWithKeyword: (payload) ->
        sendParams =
            method: 'POST'
            url: '/student_attribute_requirement_subcategories_with_keyword.json'
        requestService.service(sendParams, payload)

    #   Get all non student attribute subcategories with name containing given string.
    #   payload format:
    #       keyword: String (search term)
    nonStudentAttributeRequirementSubcategoriesWithKeyword: (payload) ->
        sendParams =
            method: 'POST'
            url: '/non_student_attribute_requirement_subcategories_with_keyword.json'
        requestService.service(sendParams, payload)

    #   get all subcategories of a project that are student attributes
    #   payload format:
    #       project: Integer (project id)
    getStudentAttributeSubcategoriesOfProject: (payload) ->
        sendParams =
            method: 'POST'
            url: 'get_student_attribute_subcategories_of_project.json'
        requestService.service(sendParams, payload)

    #   get all subcategories of a project that are not student attributes
    #   payload format:
    #       project: Integer (project id)
    getNonStudentAttributeSubcategoriesOfProject: (payload) ->
        sendParams =
            method: 'POST'
            url: 'get_non_student_attribute_subcategories_of_project.json'
        requestService.service(sendParams, payload)


angular
.module('dcsupp')
.service('RequirementSubcategory', ServiceFunction)
