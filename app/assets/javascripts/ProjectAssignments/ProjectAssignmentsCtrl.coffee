controllerFunction = ($scope, modalService, $stateParams, ProjectApplication, Project, User) ->

    $scope.modalService = modalService

    $scope.items = [
        'item1'
        'item2'
        'item3'
    ]

    $scope.getProjectAssignments = () ->
        ProjectApplication.getProjectAssignments().success((data) ->
            $scope.assignments = data
            for application in $scope.assignments
                Project.getById(application.project_id).success((project) ->
                    application.project = { title: project.title }
                    User.getById(project.user_id).success((professor) ->
                        application.professor = { name: professor.name, id: professor.id }
                    )
                )
            User.getById(application.user_id).success((student) ->
                application.student = { name: student.name, id: student.id }
            )
        )

    $scope.processOffer = (assignment, approved) ->
        payload =
            approved: approved,
            id: assignment

        ProjectApplication.processOffer(payload).success((data) ->
            $scope.getProjectAssignments(0)
        )


    $scope.getProjectAssignments()

angular
.module('dcsupp')
.controller('ProjectAssignmentsCtrl', ['$scope', 'modalService', '$stateParams', 'ProjectApplication', 'Project', 'User', controllerFunction])
