angular.module('dcsupp').config ($stateProvider) ->
    $stateProvider.state 'your_applications.application_info',
        url: '/application_info/:id'
        templateUrl: 'YourApplications/ApplicationInfo/_application_info.html'
        controller: 'ApplicationInfoCtrl'
        data:
            permissions:
                only: ['administrator', 'student']