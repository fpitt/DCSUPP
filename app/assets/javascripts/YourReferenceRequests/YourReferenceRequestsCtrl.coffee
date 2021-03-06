# -------------------------------------------------------------------------------------------------------
# Page: Your Reference Requests
#
# Summary:
# This is the Your Reference Requests page for DCSUPP for
# professors to view and manage any reference requests by students.
# -------------------------------------------------------------------------------------------------------
angular
.module('dcsupp')
.controller 'YourReferenceRequestsCtrl', ['$scope', '$stateParams', 
    'Reference', 'Project', 'ProjectApplication', 'User', 
    ($scope, $stateParams, Reference, Project, ProjectApplication, User) ->

        #   true iff something on this page resulted in an error to alert error message
        $scope.error = false

        #   get all reference requests for this professor
        $scope.getReferenceRequests = () ->
            $scope.references = []
            Reference.getReferenceRequestsOfProfessor().success((data) ->
                $scope.references = data

                #   for each reference request, get student's name and project title and id
                async.each($scope.references, (reference, callback) ->
                    async.waterfall([
                            (callback) ->
                                ProjectApplication.getById(reference.project_application_id).success((projectApplication) ->
                                    callback(null, projectApplication)
                                )
                            (projectApplication, callback) ->
                                User.getById(projectApplication.user_id).success((student) ->
                                    reference.student =
                                        name : student.name
                                    callback(null, projectApplication)
                                )
                            (projectApplication, callback) ->
                                Project.getById(projectApplication.project_id).success((project) ->
                                    reference.project =
                                        title : project.title
                                        id : project.id
                                    callback(null)
                                )
                        ],
                        (err) ->
                            callback()
                    )
                , (err) ->
                    $scope.error = err != null
                )

            )

        #   reject a reference request
        $scope.rejectReference = (reference) ->
            Reference.processReferenceApproval(reference: reference.id, approved: false).success((data) ->
                $scope.error = false
                $scope.getReferenceRequests()
            ).error((data) ->
                $scope.error = true
            )

        # run this code when page loads
        $scope.getReferenceRequests()
    ]