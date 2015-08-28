angular.module('dcsupp').config ($stateProvider) ->
    $stateProvider.state 'list_student.rate_student',
        url: '/rate_student/:id'
        templateUrl: 'ListStudent/RateStudent/_rate_student.html'
        controller: 'RateStudentCtrl'
        data:
            permissions:
                only: ['administrator', 'professor']