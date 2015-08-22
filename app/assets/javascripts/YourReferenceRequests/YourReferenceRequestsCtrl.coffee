controllerFunction = ($scope, modalService, $stateParams, Reference, Project, ProjectApplication, User) ->

    $scope.modalService = modalService

    $scope.items = [
        'item1'
        'item2'
        'item3'
    ]

    $scope.getReferenceRequests = () ->
        Reference.getReferenceRequestsOfProfessor().success((data) ->
            $scope.references = data
            for reference in $scope.references
                ProjectApplication.getById(reference.project_application_id).success((projectApplication) ->
                    User.getById(projectApplication.user_id).success((student) ->
                        reference.student =
                            name : student.name
                    )
                    Project.getById(projectApplication.project_id).success((project) ->
                        reference.project =
                            title : project.title
                            id : project.id
                    )
                )
        )

    $scope.rejectReference = (reference) ->
        payload =
            id: reference.id
            approved: false
        Reference.processReferenceApproval(payload).success((data) ->
            $scope.getReferenceRequests()
        )


    $scope.getReferenceRequests()

angular
.module('dcsupp')
.controller('YourReferenceRequestsCtrl', ['$scope', 'modalService', '$stateParams', 'Reference', 'Project', 'ProjectApplication', 'User', controllerFunction])