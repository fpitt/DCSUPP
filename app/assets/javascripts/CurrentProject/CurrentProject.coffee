angular.module('dcsupp').config ($stateProvider) ->
    $stateProvider.state 'current_project',
        url: '/current_project'
        templateUrl: 'CurrentProject/_current_project.html'
        controller: 'CurrentProjectCtrl'