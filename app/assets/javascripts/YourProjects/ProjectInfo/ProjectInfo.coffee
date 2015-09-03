# -------------------------------------------------------------------------------------------------------
# UI-Router state declaration for Project Info page.
# Note: The controller and view for this state is
# also being used by
# by current_projects.project_info state.
# -------------------------------------------------------------------------------------------------------
angular.module('dcsupp').config ($stateProvider) ->
    $stateProvider.state 'your_projects.project_info',
        url: '/project_info/:id'
        templateUrl: 'CurrentProject/ProjectInfo/_project_info.html'
        controller: 'ProjectInfoCtrl'
        data:
            permissions:
                only: ['administrator', 'professor']