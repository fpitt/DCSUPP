controllerFunction = ($scope, requestService, $stateParams) ->

    $scope.project = null
    $scope.sendParams =
        url: '/users/' + $stateParams.id + '.json'
        method: 'GET'


    successFunction = (data) ->
        $scope.student = data


    $scope.flip = ->
        requestService.service($scope.sendParams).success(successFunction)

    $scope.flip()

angular
.module('dcsupp')
.controller('SelectedStudentCtrl', ['$scope', 'requestService', '$stateParams', controllerFunction])
