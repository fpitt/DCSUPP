angular.module('dcsupp').config ($stateProvider) ->
    $stateProvider.state 'list_professor.professor_info',
        url: '/professor_info/:id'
        templateUrl: 'ListProfessor/ProfessorInfo/_professor_info.html'
        controller: 'ProfessorInfoCtrl'
        data:
            permissions:
                only: ['administrator', 'professor', 'student']