# -------------------------------------------------------------------------------------------------------
# UI-Router state declaration for Project Info page.
# -------------------------------------------------------------------------------------------------------
angular.module('dcsupp').config ($stateProvider) ->
    $stateProvider.state 'current_project.project_info',
        url: '/project_info/:id'
        templateUrl: 'CurrentProject/ProjectInfo/_project_info.html'
        controller: 'ProjectInfoCtrl'
        data:
            permissions:
                only: ['professor', 'student', 'administrator']