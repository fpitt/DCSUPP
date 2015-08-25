angular.module('dcsupp').config ($stateProvider) ->
    $stateProvider.state 'your_applications',
        url: '/your_applications'
        templateUrl: 'YourApplications/_your_applications.html'
        controller: 'YourApplicationsCtrl'
        data:
            permissions:
                only: ['student', 'administrator']