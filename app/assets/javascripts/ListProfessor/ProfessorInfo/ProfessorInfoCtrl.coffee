# NOT USED AT THE MOMENT
angular
.module('dcsupp')
.controller 'ProfessorInfoCtrl', ['$scope', 'requestService', '$stateParams', 
    'User', ($scope, $stateParams, User) ->

        $scope.sendParams =
            url: '/users/' + $stateParams.id + '.json'
            method: 'GET'


        $scope.nameCollapsed = $scope.emailCollapsed = true
        $scope.user = {}
        $scope.payload = {}

        $scope.getUser = ->
            requestService.service($scope.sendParams).success((data) ->
                $scope.user = data
                $scope.payload = jQuery.extend(true, {}, data))
            return

        $scope.patchUser = ->
            patchSendParams =
                url: '/users/' + $scope.user.id + '.json'
                method: 'PATCH'
            requestService.service(patchSendParams, $scope.payload).success((data) ->
                $scope.getStudent())
            return

        $scope.getUser();
    ]
