# -------------------------------------------------------------------------------------------------------
# UI-Router state declaration for Your Projects page.
# -------------------------------------------------------------------------------------------------------
angular.module('dcsupp').config(['$stateProvider', ($stateProvider) ->
    $stateProvider.state 'your_projects',
        url: '/your_projects'
        templateUrl: 'YourProjects/_your_projects.html'
        controller: 'YourProjectsCtrl'
        data:
            permissions:
                only: ['professor', 'administrator']
                redirectTo: 'intro'
])