angular.module('dcsupp').config ($stateProvider) ->
    $stateProvider.state 'your_projects.update_project',
        url: '/update_project/:id'
        templateUrl: 'YourProjects/UpdateProject/_update_project.html'
        controller: 'UpdateProjectCtrl'
        data:
            permissions:
                only: ['administrator', 'professor']