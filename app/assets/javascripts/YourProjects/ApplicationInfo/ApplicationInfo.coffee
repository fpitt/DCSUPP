# -------------------------------------------------------------------------------------------------------
# UI-Router state declaration for Application Info page.
# -------------------------------------------------------------------------------------------------------
angular.module('dcsupp').config(['$stateProvider', ($stateProvider) ->
    $stateProvider.state 'your_projects.application_info',
        url: '/application_info/:id'
        templateUrl: 'YourApplications/ApplicationInfo/_application_info.html'
        controller: 'ApplicationInfoCtrl'
        data:
            permissions:
                only: ['administrator', 'professor']
])