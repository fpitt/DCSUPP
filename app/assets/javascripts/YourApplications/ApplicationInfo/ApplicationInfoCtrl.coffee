controllerFunction = ($scope, $stateParams, ProjectApplication) ->
    $scope.loadProjectApplications = ->
        ProjectApplication.getById($stateParams.id).success((data) ->
            $scope.application = data)

    $scope.loadProjectApplications()

angular
.module('dcsupp')
.controller('ApplicationInfoCtrl', ['$scope', '$stateParams', 'ProjectApplication', controllerFunction])