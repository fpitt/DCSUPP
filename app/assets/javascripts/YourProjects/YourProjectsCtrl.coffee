controllerFunction = ($scope, modalService, $state, User, Project, ProjectApplication) ->

    $scope.modalService = modalService
    $scope.showProject = false;
    $scope.pagenumber = 1
    $scope.projects = null
    $scope.selectedProject = {}
    $scope.filtr = 'In progress'
    $scope.items = [
        'item1'
        'item2'
        'item3'
    ]

#    $scope.loadProjects = () ->
#        Project.getByCurrentUser().success((data) ->
#            $scope.projects = data)


    $scope.getInProgressProjects = () ->
        $scope.filter = 'In progress'
        Project.getInProgressProjectsOfUser((data) ->
            $scope.projects = data)

    $scope.getCompletedProjects = () ->
        $scope.filter = 'Completed'
        Projects.getCompletedProjectsOfUser((data) ->
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
