controllerFunction = ($scope, requestService) ->

    $scope.projects = null
    $scope.selectedProject = null
    $scope.url = '/project.json'
    $scope.sendParams =
        project_id: $stateParams.id
        url: $scope.url

    successFunction = (data) ->
        $scope.selectedProject = data

    $scope.getProject = () ->
        requestService.flip($scope.sendParams).success(successFunction)

    $scope.getProject();

angular
.module('dcsupp')
.controller('SelectedProjectCtrl', ['$scope', 'requestService', controllerFunction])
