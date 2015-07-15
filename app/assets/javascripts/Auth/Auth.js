angular.module('dcsupp')
    .config(function ($stateProvider) {
        $stateProvider.state('auth', {
            url: '/auth',
            templateUrl: 'Auth/_auth.html',
            controller: 'AuthCtrl'
        });
    });
