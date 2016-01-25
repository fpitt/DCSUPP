# -------------------------------------------------------------------------------------------------------
#
#
# UI-Router state declaration for List Professor page.
# -------------------------------------------------------------------------------------------------------
angular.module('dcsupp').config ['$stateProvider', ($stateProvider) ->
    $stateProvider.state 'list_professor',
        url: '/list_professor'
        templateUrl: 'ListProfessor/_list_professor.html'
        controller: 'ListProfessorCtrl'
        data:
            permissions:
                only: ['administrator', 'professor', 'student']
                redirectTo: 'intro'
] 