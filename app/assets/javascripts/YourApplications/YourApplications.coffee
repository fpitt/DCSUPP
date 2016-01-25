# -------------------------------------------------------------------------------------------------------
# UI-Router state declaration for Your Applications page.
# -------------------------------------------------------------------------------------------------------
angular.module('dcsupp').config(['$stateProvider', ($stateProvider) ->
    $stateProvider.state 'your_applications',
        url: '/your_applications'
        templateUrl: 'YourApplications/_your_applications.html'
        controller: 'YourApplicationsCtrl'
        data:
            permissions:
                only: ['student']
                redirectTo: 'intro'
])