angular.module('dcsupp').config ($stateProvider) ->
    $stateProvider.state 'project_assignments',
        url: '/project_assignments'
        templateUrl: 'ProjectAssignments/_project_assignments.html'
        controller: 'ProjectAssignmentsCtrl'
        data:
            permissions:
                only: ['administrator']