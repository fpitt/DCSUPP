angular.module('dcsupp').config ($stateProvider) ->
    $stateProvider.state 'auth',
        url: '/auth'
        templateUrl: 'Auth/_auth.html'
        controller: 'AuthCtrl'


