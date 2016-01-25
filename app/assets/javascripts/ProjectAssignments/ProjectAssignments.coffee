# -------------------------------------------------------------------------------------------------------
# UI-Router state declaration for Project Assignments page.
# -------------------------------------------------------------------------------------------------------
angular.module('dcsupp').config ['$stateProvider', ($stateProvider) ->
    $stateProvider.state 'project_assignments',
        url: '/project_assignments'
        templateUrl: 'ProjectAssignments/_project_assignments.html'
        controller: 'ProjectAssignmentsCtrl'
        data:
            permissions:
                only: ['administrator']
                redirectTo: 'intro'
]