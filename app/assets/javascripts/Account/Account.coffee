angular.module('dcsupp').config ['$stateProvider', ($stateProvider) ->
    $stateProvider.state 'account',
        url: '/account'
        templateUrl: 'Account/_account.html'
        controller: 'AccountCtrl'
        data:
        	permissions:
        		only: ['administrator', 'professor', 'student']
]