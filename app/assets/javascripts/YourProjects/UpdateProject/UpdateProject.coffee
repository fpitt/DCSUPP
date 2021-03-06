# -------------------------------------------------------------------------------------------------------
# UI-Router state declaration for Update Project page.
# -------------------------------------------------------------------------------------------------------
angular.module('dcsupp').config(['$stateProvider', ($stateProvider) ->
    $stateProvider.state 'your_projects.update_project',
        url: '/update_project/:id'
        templateUrl: 'YourProjects/UpdateProject/_update_project.html'
        controller: 'UpdateProjectCtrl'
])