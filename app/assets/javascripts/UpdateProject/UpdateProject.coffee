angular.module('dcsupp').config ($stateProvider) ->
    $stateProvider.state 'update_project',
        url: '/update_project/:id'
        templateUrl: 'UpdateProject/_update_project.html'
        controller: 'UpdateProjectCtrl'
        data:
            permissions:
                only: ['administrator', 'professor']