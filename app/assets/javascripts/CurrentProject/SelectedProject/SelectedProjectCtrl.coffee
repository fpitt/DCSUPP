controllerFunction = ($scope, requestService, $stateParams) ->

    $scope.pagenumber = 1
    $scope.projects = null
    $scope.url = '/projects/' + $stateParams.id + '.json';
    $scope.sendParams =
        url: $scope.url
        method: "GET"
    $scope.payload =
        project:
            id: $stateParams.id


    successFunction = (data) ->
        $scope.projects = data
        console.log($scope.projects)


    $scope.flip = ->

        requestService.service($scope.sendParams, $scope.payload).success(successFunction)

    $scope.flip()

angular
.module('dcsupp')
.controller('CurrentProjectCtrl', ['$scope', 'requestService', '$stateParams', controllerFunction])