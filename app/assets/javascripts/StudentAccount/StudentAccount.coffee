angular.module('dcsupp').config ($stateProvider) ->
    $stateProvider.state 'student_account',
        url: '/student_account'
        templateUrl: 'StudentAccount/_student_account.html'
        controller: 'StudentAccountCtrl'