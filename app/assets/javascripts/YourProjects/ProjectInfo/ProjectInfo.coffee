angular.module('dcsupp').config ($stateProvider) ->
    $stateProvider.state 'your_projects.project_info',
        url: '/:id'
        templateUrl: 'YourProjects/ProjectInfo/_project_info.html'
        controller: 'ProjectInfoCtrl'
        data:
            permissions:
                only: ['administrator', 'professor']