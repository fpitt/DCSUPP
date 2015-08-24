controllerFunction = ($scope, $stateParams, ProjectApplication, ProjectRequirement, RequirementSubcategory, StudentAttribute, Project, Reference, User) ->


    $scope.loadApplicationInfo = ->
        $scope.attributes = []
        ProjectApplication.getById($stateParams.id).success((data) ->
            $scope.application = data
            payload = project: data.project_id

            Project.getById(data.project_id).success((data) ->
                $scope.project = data
            )

            ProjectRequirement.getByProject(payload).success((projectRequirements) ->
                for req in projectRequirements
                    RequirementSubcategory.getById(req.requirement_subcategory_id).success((subcategory) ->
                        if (subcategory.student_attribute)
                            payload = subcategory: subcategory.id
                            StudentAttribute.getBySubcategoryAndCurrentUser(payload).success((studentAttribute) ->
                                $scope.attributes.push(attribute_type: subcategory.attribute_type, sub_category_name: subcategory.sub_category_name, value: studentAttribute.value)
                            )
                    )
            )
        )

    $scope.getAllReferences = () ->
        payload =
            projectApplication : $stateParams.id
        Reference.getByProjectApplication(payload).success((data) ->
            $scope.allReferences = data

            for reference in $scope.allReferences
                User.getById(reference.user_id).success((data) ->
                    reference.professor = data;
                )
        )


    $scope.processOffer = (approved) ->
        payload =
            approved: approved,
            id: $scope.application.id


        ProjectApplication.processOffer(payload).success((data) ->
            $scope.loadApplicationInfo()
        )

    $scope.processReferenceApproval = (reference, val) ->
        payload =
            id: reference.id
            approved: val
        Reference.processReferenceApproval(payload).success((data) ->
            $scope.getAllReferences()
        )

    $scope.getStudentApprovedReferences = () ->
        payload =
            projectApplication : $stateParams.id
        Reference.getStudentApprovedByProjectApplication(payload).success((data) ->
            $scope.studentApprovedReferences = data

            for reference in $scope.allReferences
                User.getById(reference.user_id).success((data) ->
                    reference.professor = data;
                )
        )


    $scope.loadApplicationInfo()
    $scope.getAllReferences()
    $scope.getStudentApprovedReferences()


angular
.module('dcsupp')
.controller('ApplicationInfoCtrl', ['$scope', '$stateParams', 'ProjectApplication', 'ProjectRequirement', 'RequirementSubcategory', 'StudentAttribute', 'Project', 'Reference', 'User', controllerFunction])