
angular
.module('dcsupp')
.controller 'ProfessorInfoCtrl', ['$scope', '$stateParams', 
    'User', ($scope, $stateParams, User) ->

        $scope.user = null

        $scope.getUser = ->
            User.getById($stateParams.id).success (data) ->
                $scope.user = data

        $scope.getUser();
    ]
