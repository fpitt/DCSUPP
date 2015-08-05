controllerFunction = ($scope, requestService, $stateParams, Project) ->

    $scope.loadProject = ->
        Project.getById($stateeParams.id).success((data) ->
            $scope.project = data)

    $scope.loadProject()

angular
.module('dcsupp')
.controller('SelectedProjectCtrl', ['$scope', 'requestService', '$stateParams', 'Project', controllerFunction])