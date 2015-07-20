angular.module('dcsupp').config ($stateProvider) ->
    $stateProvider.state 'create_project',
        url: '/create_project'
        templateUrl: 'CreateProject/_create_project.html'
        controller: 'CreateProjectCtrl'
        data:
            permissions:
                only: ['professor']

