angular.module('dcsupp').config ($stateProvider) ->
    $stateProvider.state 'your_projects.create_project',
        url: '/create_project'
        templateUrl: 'YourProjects/CreateProject/_create_project.html'
        controller: 'CreateProjectCtrl'
        data:
            permissions:
                only: ['professor', 'administrator']

