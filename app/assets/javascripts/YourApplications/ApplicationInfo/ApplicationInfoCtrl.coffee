# -------------------------------------------------------------------------------------------------------
# Page: Application Info Page
#
# Summary:
# This is the application info page for DCSUPP for students
# to view their application for a particular project.
# -------------------------------------------------------------------------------------------------------
controllerFunction = ($scope, $stateParams, ProjectApplication, ProjectRequirement, RequirementSubcategory, StudentAttribute, Project, Reference, User) ->

    #   get the application's information
    $scope.getApplicationInfo = ->
        ProjectApplication.getById($stateParams.id).success((data) ->
            $scope.application = data

            #   get the project info
            Project.getById(data.project_id).success((data) ->
                $scope.project = data
            )

            #   get student info
            User.getById($scope.application.user_id).success((data) ->
                $scope.application.student = data
            )

            #   get student attributes
            $scope.attributes = []
            RequirementSubcategory.getStudentAttributeSubcategoriesOfProject(project: $scope.application.project_id).success((data) ->
                async.each(data, (req, callback) ->
                    StudentAttribute.getBySubcategoryAndCurrentUser(subcategory: req.id).success((attr) ->
                        $scope.attributes.push(
                            attribute_type: req.attribute_type
                            sub_category_name:req.sub_category_name
                            value: attr.value)
                        callback()
                    )
                )
            )
        )

    #   get all reference requests that this student
    #   has requested for the application
    $scope.getAllReferences = () ->
        Reference.getByProjectApplication(projectApplication: $stateParams.id).success((data) ->
            $scope.allReferences = data
            #   get professor info
            for reference in $scope.allReferences
                User.getById(reference.user_id).success((data) ->
                    reference.professor = data;
                )
        )

    #   save student's approval/rejection of position offer
    $scope.processOffer = (approved) ->
        ProjectApplication.processOffer(approved: approved,
            application: $scope.application.id).success((data) ->
            #   reload application info
            $scope.loadApplicationInfo()
        )

    #   save student's decision to use reference letter
    $scope.processReferenceApproval = (reference, val) ->
        Reference.processReferenceApproval(reference: reference.id, approved: val).success((data) ->
            #   reload reference requests
            $scope.getAllReferences()
        )

#    $scope.getStudentApprovedReferences = () ->
#        payload =
#            projectApplication : $stateParams.id
#        Reference.getStudentApprovedByProjectApplication(payload).success((data) ->
#            $scope.studentApprovedReferences = data
#
#            for reference in $scope.studentApprovedReferences
#                User.getById(reference.user_id).success((data) ->
#                    reference.professor = data;
#                )
#        )


    #   run this code when page loads
    $scope.getApplicationInfo()
    $scope.getAllReferences()


angular
.module('dcsupp')
.controller('ApplicationInfoCtrl', ['$scope', '$stateParams', 'ProjectApplication', 'ProjectRequirement', 'RequirementSubcategory', 'StudentAttribute', 'Project', 'Reference', 'User', controllerFunction])