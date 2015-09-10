# ---------------------------------------------------------
# Service Function Calls: Student Attribute
#
# These are the server function calls for the
# student attributes. We define the method, url and payload
# as services and call these methods using controller
# functions in the various folders.
# ---------------------------------------------------------
ServiceFunction = (requestService) ->

    #   get the current user's student attribute
    #   for a given subcategory (i.e. if subcategory
    #   is CSC148 grade, return current user's CSC148 grade student attribute).
    getBySubcategoryAndCurrentUser: (payload) ->
        sendParams =
            method: 'POST'
            url: '/get_attribute_by_user_and_subcategory.json'
        return requestService.service(sendParams, payload)

    #   all of attributes of the given user and requirement category
    #   id: Integer (user's id)
    #   category_id: Integer (category's id)
    getallUserAttribute: (id, category_id) ->
        sendParams =
            method: 'POST'
            url: '/get_all_attributes.json'
        autopayload =
            user_id: id
            category_id: category_id
        requestService.service(sendParams, autopayload)


    #   display 10 student attributes
    #   used in Account page to navigate through all attributes
    #   payload format:
    #       direction: Integer (10 to go forward one page, -10 to go back one page)
    #       pagenumber: Integer (current page number)
    flipStudentSettings: (payload) ->
        sendParams =
            method: 'POST'
            url: '/flip_student_settings.json'
        requestService.service(sendParams, payload)

    ###
        get all student attributes for a given student
        payload format:
            student: Integer (student's id)
    ###
    getStudentAttributesOfStudent: (payload) ->
        sendParams =
            method: 'POST'
            url: '/get_student_attributes_of_student.json'
        requestService.service(sendParams, payload)


angular
.module('dcsupp')
.service('StudentAttribute', ServiceFunction)
