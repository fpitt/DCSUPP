controllerFunction = ($scope, requestService, $stateParams) ->

    $scope.project = null
    $scope.sendParams =
        url: '/projects/' + $stateParams.id + '.json'
        method: 'GET'
    $scope.payload =
        project:
            id: $stateParams.id


    successFunction = (data) ->
        $scope.project = data
        console.log($scope.project)


    $scope.flip = ->
        requestService.service($scope.sendParams, $scope.payload).success(successFunction)

    $scope.flip()

angular
.module('dcsupp')
.controller('SelectedProjectCtrl', ['$scope', 'requestService', '$stateParams', controllerFunction])