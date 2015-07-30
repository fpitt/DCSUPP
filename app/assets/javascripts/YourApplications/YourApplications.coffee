angular.module('dcsupp').config ($stateProvider) ->
    $stateProvider.state 'your_applications',
        url: '/your_applications'
        templateUrl: 'YourApplications/_application.html'
        controller: 'YourApplicationsCtrl'
        data:
            permissions:
                only: ['administrator', 'student']