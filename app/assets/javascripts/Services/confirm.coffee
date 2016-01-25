###*
# A generic confirmation for risky actions.
# Usage: Add attributes: ng-really-message="Are you sure"? ng-really-click="takeAction()" function
###

angular.module('dcsupp').directive 'ngReallyClick', [ ->
    
    restrict: 'A'
    link: (scope, element, attrs) ->
        element.bind 'click', ->
            message = attrs.ngReallyMessage
            if message and confirm(message)
                scope.$apply attrs.ngReallyClick
            return
        return
]
