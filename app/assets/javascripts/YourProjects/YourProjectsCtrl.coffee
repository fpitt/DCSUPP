controllerFunction = ($scope, requestService, modalService, $state, User, Project) ->

    $scope.modalService = modalService
    $scope.showProject = false;
    $scope.pagenumber = 1
    $scope.projects = null
    $scope.selectedProject = {}
    $scope.sendParams =
        method: 'POST'
        url: '/get_projects_of_user.json'


    successFunction = (data) ->
        $scope.projects = data

    $scope.items = [
        'item1'
        'item2'
        'item3'
    ]

    $scope.loadProjects = () ->
        Project.getByCurrentUser().success((data) ->
            $scope.projects = data)

    $scope.selectProject = (project) ->
        $scope.selectedProject = project
        $state.go('your_projects.project_info', {id: $scope.selectedProject.id})


    $scope.loadProjects()

angular
.module('dcsupp')
.controller('YourProjectsCtrl', ['$scope', 'requestService', 'modalService', '$state', 'User', 'Project', controllerFunction])
