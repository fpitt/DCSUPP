# -------------------------------------------------------------------------------------------------------
# UI-Router state declaration for Your Reference Requests page.
# -------------------------------------------------------------------------------------------------------
angular.module('dcsupp').config(['$stateProvider', ($stateProvider) ->
    $stateProvider.state 'your_reference_requests',
        url: '/your_reference_requests'
        templateUrl: 'YourReferenceRequests/_your_reference_requests.html'
        controller: 'YourReferenceRequestsCtrl'
        data:
            permissions:
                only: ['administrator', 'professor']
])