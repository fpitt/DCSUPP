# ---------------------------------------------------------
# Service Function Calls: User
#
# These are the server function calls for the users.
# We define the method, url and payload
# as services and call these methods using controller
# functions in the various folders.
# ---------------------------------------------------------
angular.module('dcsupp').service 'User', ['requestService', (requestService) ->

    #   get the current user
    getUser : ->
        sendParams =
            url: '/current_user.json'
            method: 'POST'
        requestService.service(sendParams)

    #   update user information
    updateUser : (payload)->
        sendParams =
            url: '/user_information.json'
            method: 'POST'
        requestService.service(sendParams, payload)

    #   get a user by id
    #   id: Integer (user id)
    getById : (id) ->
        sendParams =
            url: '/users/' + id + '.json'
            method: 'GET'
        requestService.service(sendParams)

    #   not used
    flipProfessors : (payload) ->
        sendParams =
            url: '/flip_professor_direction.json'
            method: 'POST'
        requestService.service(sendParams, payload)

    #   get all professors whose name contains keyword
    #   payload format:
    #       keyword: String (search term)
    getProfessorContainingKeyword : (payload) ->
        sendParams =
            url: '/get_professor_containing_keyword.json'
            method: 'POST'
        requestService.service(sendParams, payload)

    ###
        return a filtered page (10 rows) of students based on filter tags
    	pagenumber: Integer (current page number)
		filter: [ list of requirement subcategories with form: {name: subcategory name, id: object id} ]
		direction: Integer (+10 to go forward a page, -10 to go backward a page)
    ###
    filterStudents: (payload) ->
        sendParams =
            method: 'POST'
            url: '/filter_students.json'
        requestService.service(sendParams, payload)

    #   get all subcategories whose name contains keyword
    #   payload format:
    #       keyword: String (search term)
    getSubCategoryContainingKeyword : (payload) ->
        sendParams =
            url: '/requirement_suggestion.json'
            method: 'POST'
        requestService.service(sendParams, payload)
    ]