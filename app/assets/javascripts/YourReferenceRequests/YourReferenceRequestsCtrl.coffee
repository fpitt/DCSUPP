# -------------------------------------------------------------------------------------------------------
# Page: Your Reference Requests
#
# Summary:
# This is the Your Reference Requests page for DCSUPP for
# professors to view and manage any reference requests by students.
# -------------------------------------------------------------------------------------------------------
controllerFunction = ($scope, modalService, $stateParams, Reference, Project, ProjectApplication, User) ->
    #   pop-up service for page settings + information
    $scope.modalService = modalService

    #   get all reference requests for this professor
    $scope.getReferenceRequests = () ->
        Reference.getReferenceRequestsOfProfessor().success((data) ->
            $scope.references = data

            #   for each reference request, get student's name and project title and id
            async.each($scope.references, (reference, callback) ->
                ProjectApplication.getById(reference.project_application_id).success((projectApplication) ->
                    User.getById(projectApplication.user_id).success((student) ->
                        reference.student =
                            name : student.name
                        Project.getById(projectApplication.project_id).success((project) ->
                            reference.project =
                                title : project.title
                                id : project.id

                            callback()
                        )
                    )
                )
            , (err) ->
            )

        )

    #   reject a reference request
    $scope.rejectReference = (reference) ->
        Reference.processReferenceApproval(reference: reference.id, approved: false).success((data) ->
            $scope.getReferenceRequests()
        )

    # run this code when page loads
    $scope.getReferenceRequests()

angular
.module('dcsupp')
.controller('YourReferenceRequestsCtrl', ['$scope', 'modalService', '$stateParams', 'Reference', 'Project', 'ProjectApplication', 'User', controllerFunction])