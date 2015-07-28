controllerFunction = ($scope, requestService, modalService, $state) ->

    $scope.modalService = modalService
    $scope.showProject = false;
    $scope.pagenumber = 1
    $scope.projects = null
    $scope.selectedProject = {}
    $scope.sendParams =
        method: 'POST'
        url: '/flip_project_direction.json'
    $scope.payload =
        group:
            title: "testtitle"
            description: "test description"

    successFunction = (data) ->
        $scope.projects = data

    $scope.items = [
        'item1'
        'item2'
        'item3'
    ]

    $scope.flip = (pushDirection) ->
        $scope.payload["direction"] = pushDirection

        requestService.service($scope.sendParams, $scope.payload).success(successFunction)

    $scope.selectProject = (project) ->
        $scope.selectedProject = project
        $state.go('your_projects.project_info', {id: $scope.selectedProject.id})

    $('[data-toggle="tooltip"]').tooltip()
    $scope.flip(0)


angular
.module('dcsupp')
.controller('YourProjectsCtrl', ['$scope', 'requestService', 'modalService', '$state', controllerFunction])
