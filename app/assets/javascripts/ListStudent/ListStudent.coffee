angular.module('dcsupp').config ($stateProvider) ->
    $stateProvider.state 'list_student',
        url: '/list_student'
        templateUrl: 'ListStudent/_list_student.html'
        controller: 'ListStudentCtrl'
        data:
            permissions:
                only: ['administrator', 'professor']