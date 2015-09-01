ServiceFunction = (requestService) ->

#    create: (payload) ->
#        return
#
#    patch: (id, payload) ->
#        return
#
#    getAll: () ->
#        return
#
#    getById: (id) ->
#        return

    getByCurrentUser: () ->
        sendParams =
            method: 'POST'
            url: '/get_projects_of_user.json'
        return requestService.service(sendParams)

    getBySubcategoryAndCurrentUser: (payload) ->
        sendParams =
            method: 'POST'
            url: '/get_attribute_by_user_and_subcategory.json'
        return requestService.service(sendParams, payload)

    getallUserAttribute: (id, category_id) ->
        sendParams =
            method: 'POST'
            url: '/get_all_attributes.json'
        autopayload =
            user_id: id
            category_id: category_id
        requestService.service(sendParams, autopayload)


    flipStudentSettings: (payload) ->
        sendParams =
            method: 'POST'
            url: '/flip_student_settings.json'
        requestService.service(sendParams, payload)


angular
.module('dcsupp')
.service('StudentAttribute', ServiceFunction)
