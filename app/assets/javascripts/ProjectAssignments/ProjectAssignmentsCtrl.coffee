# -------------------------------------------------------------------------------------------------------
# Page: Project Assignments
#
# Summary:
# This is the Project Assignments page for DCSUPP. It
# is for admins to approve of student-professor project assignments.
# -------------------------------------------------------------------------------------------------------
controllerFunction = ($scope, modalService, $stateParams, ProjectApplication, Project, User) ->
    #   pop-up service for page settings and info
    $scope.modalService = modalService

    #   true iff an error on this page on occurred alert error message
    $scope.error = false

    #   get all pending student-professor project assignments
    $scope.getProjectAssignments = () ->
        #   get all project assignments that require approval
        ProjectApplication. getRequireAdministratorApprovalAssignments().success((data) ->
            $scope.assignments = data
            #   get professor, project title, and student for each
            #   project assignment
            async.each($scope.assignments, (application, callback) ->
                async.waterfall([
                        (callback) ->
                            Project.getById(application.project_id).success((project) ->
                                application.project = { title: project.title }
                                callback(null, project)
                            )
                        (project, callback) ->
                            User.getById(project.user_id).success((professor) ->
                                application.professor = { name: professor.name, id: professor.id }
                                callback(null)
                            )
                        (callback) ->
                            User.getById(application.user_id).success((student) ->
                                application.student = { name: student.name, id: student.id }
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

    #   save the administrator's decision (approve/deny) the
    #   selected project assignment
    $scope.processOffer = (assignment, approved) ->
        ProjectApplication.processOffer(approved: approved, application: assignment).success((data) ->
            $scope.error = false
            #   reload project assignments to reflect changes
            $scope.getProjectAssignments()
        ).error((data) ->
            $scope.error = true
        )


    #   run this code when page loads
    $scope.getProjectAssignments()

angular
.module('dcsupp')
.controller('ProjectAssignmentsCtrl', ['$scope', 'modalService', '$stateParams', 
    'ProjectApplication', 'Project', 'User', controllerFunction])

ProjectAssignmentsCtrl.$injector = ['$scope', 'modalService', '$stateParams', 
    'ProjectApplication', 'Project', 'User']