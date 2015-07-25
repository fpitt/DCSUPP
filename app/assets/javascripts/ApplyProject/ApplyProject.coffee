angular.module('dcsupp').config ($stateProvider) ->
    $stateProvider.state 'apply_project',
        url: '/apply_project/:id'
        templateUrl: 'ApplyProject/_apply_project.html'
        controller: 'ApplyProjectCtrl'
        data:
            permissions:
                only: ['student', 'administrator']