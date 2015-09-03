# -------------------------------------------------------------------------------------------------------
# UI-Router state declaration for Project Info page.
# Note: The controller and view is also being used for
# by your_projects.project_info state.
# -------------------------------------------------------------------------------------------------------
angular.module('dcsupp').config ($stateProvider) ->
    $stateProvider.state 'current_project.project_info',
        url: '/project_info/:id'
        templateUrl: 'CurrentProject/ProjectInfo/_project_info.html'
        controller: 'ProjectInfoCtrl'
        data:
            permissions:
                only: ['professor', 'student', 'administrator']