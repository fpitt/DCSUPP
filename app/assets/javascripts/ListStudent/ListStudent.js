/**
 * Created by Christina on 2015-06-28.
 */
angular.module('dcsupp')
    .config(function ($stateProvider) {
        $stateProvider.state('list_student', {
            url: '/list_student',
            templateUrl: 'ListStudent/_list_student.html',
            controller: 'ListStudentCtrl'
        });
    });
