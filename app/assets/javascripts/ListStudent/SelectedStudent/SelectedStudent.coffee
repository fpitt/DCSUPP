angular.module('dcsupp').config ($stateProvider) ->
    $stateProvider.state 'list_student.selected_student',
        url: '/selected_student/:id'
        templateUrl: 'ListStudent/SelectedStudent/_selected_student.html'
        controller: 'SelectedStudentCtrl'