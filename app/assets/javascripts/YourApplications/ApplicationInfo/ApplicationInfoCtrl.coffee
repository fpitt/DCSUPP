controllerFunction = ($scope, requestService, $stateParams) ->
    $scope.sendParams =
        url: '/project_applications/' + $stateParams.id + '.json'
        method: 'GET'


    $scope.flip = ->
        requestService.service($scope.sendParams).success((data) ->
            $scope.application = data)

    $scope.flip()

angular
.module('dcsupp')
.controller('ApplicationInfoCtrl', ['$scope', 'requestService', '$stateParams', controllerFunction])