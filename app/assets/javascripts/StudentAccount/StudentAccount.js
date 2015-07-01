angular.module('dcsupp')
    .config(function ($stateProvider) {
        $stateProvider.state('student_account', {
            url: '/student_account',
            templateUrl: 'StudentAccount/_student_account.html',
            controller: 'StudentAccountCtrl'
        });
    });
