angular.module('dcsupp')
    .config(function ($stateProvider) {
        $stateProvider.state('create_project', {
            url: '/create_project',
            templateUrl: 'CreateProject/_create_project.html',
            controller: 'CreateProjectCtrl'
        });
    });
