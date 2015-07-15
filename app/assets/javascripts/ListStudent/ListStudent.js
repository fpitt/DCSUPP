angular.module('dcsupp')
    .config(function ($stateProvider) {
        $stateProvider.state('list_student', {
            url: '/list_student',
            templateUrl: 'ListStudent/_list_student.html',
            controller: 'ListStudentCtrl'
        });
    });