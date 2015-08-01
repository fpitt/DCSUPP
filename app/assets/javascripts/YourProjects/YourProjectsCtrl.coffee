controllerFunction = ($scope, requestService, modalService, $state, User) ->

    $scope.modalService = modalService
    $scope.showProject = false;
    $scope.pagenumber = 1
    $scope.projects = null
    $scope.selectedProject = {}
    $scope.sendParams =
        method: 'GET'
        url: '/get_projects_of_user.json'


    successFunction = (data) ->
        $scope.projects = data

    $scope.items = [
        'item1'
        'item2'
        'item3'
    ]

    $scope.loadProjects = (pushDirection) ->
        requestService.service($scope.sendParams).success(successFunction)


    $scope.selectProject = (project) ->
        $scope.selectedProject = project
        $state.go('your_projects.project_info', {id: $scope.selectedProject.id})


    $scope.loadProjects()

angular
.module('dcsupp')
.controller('YourProjectsCtrl', ['$scope', 'requestService', 'modalService', '$state', 'User', controllerFunction])
