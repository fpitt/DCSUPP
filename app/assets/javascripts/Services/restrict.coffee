###
#   Directive: restrict
#   Restricts unauthorized users from viewing
#   HTML elements.
#   E.g. button access="administrator student" restrict="" Apply
#   The button above can only be seen by admins and students
###

angular.module('dcsupp').directive 'restrict', (User, $q) ->

    restrict: 'A'
    prioriry: 100000
    scope: false
    compile: (element, attr, linker) ->
        deferred = $q.defer()
        User.getUser().success (data) ->
            if (data.administrator)
                role = 'administrator'
            else if (data.professor)
                role = 'professor'
            else
                role = 'student'

            attributes = attr.access.split(" ")
            if (role in attributes)
                accessDenied = false
            else
                accessDenied = true

            if (accessDenied)
                element.children().remove()
                element.remove()
            else
                element.removeClass("hidden_class")

            deferred.resolve()
                
        return deferred.promise
