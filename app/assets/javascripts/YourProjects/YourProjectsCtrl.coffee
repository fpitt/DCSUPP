controllerFunction = ($scope, modalService, $state, User, Project, ProjectApplication) ->

    $scope.modalService = modalService
    $scope.showProject = false;
    $scope.pagenumber = 1
    $scope.projects = null
    $scope.selectedProject = {}

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
        $scope.loadProjectApplications(project);
        $state.go('your_projects.project_info', {id: $scope.selectedProject.id})

    $scope.loadProjectApplications = (project) ->
        payload =
            id: project.id
        ProjectApplication.getByProject(payload).success((data)->
            $scope.applications = data)


    $scope.loadProjects()

angular
.module('dcsupp')
.controller('YourProjectsCtrl', ['$scope', 'modalService', '$state', 'User', 'Project', 'ProjectApplication', controllerFunction])
