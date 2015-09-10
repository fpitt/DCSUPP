controllerFunction = ($scope, modalService, $state, User, Project, ProjectApplication) ->

    $scope.modalService = modalService
    $scope.showProject = false;
    $scope.pagenumber = 1
    $scope.projects = null
    $scope.selectedProject = null
    $scope.applications = null
    $scope.filter = 'In progress'


    ###
    Clear all current information in the view.
    ###
    $scope.clearAll = () ->
        $scope.selectedProject = null;
        $scope.applications = null
        $scope.projects = null;

    $scope.getInProgressProjects = () ->
        $scope.clearAll()
        $scope.filter = 'In progress'
        Project.getInProgressProjectsOfCurrentUser().success((data) ->
            $scope.projects = data)

    $scope.getCompletedProjects = () ->
        $scope.clearAll()
        $scope.filter = 'Completed'
        Project.getCompletedProjectsOfCurrentUser().success((data) ->
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


    $scope.getInProgressProjects()

angular
.module('dcsupp')
.controller('YourProjectsCtrl', ['$scope', 'modalService', '$state', 'User', 'Project', 'ProjectApplication', controllerFunction])
