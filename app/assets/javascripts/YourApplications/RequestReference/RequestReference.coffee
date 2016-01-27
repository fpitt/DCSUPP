# -------------------------------------------------------------------------------------------------------
# UI-Router state declaration for Request Reference page.
# -------------------------------------------------------------------------------------------------------
angular.module('dcsupp').config(['$stateProvider', ($stateProvider) ->
    $stateProvider.state 'your_applications.request_reference',
        url: '/request_reference/:id'
        templateUrl: 'YourApplications/RequestReference/_request_reference.html'
        controller: 'RequestReferenceCtrl'
])