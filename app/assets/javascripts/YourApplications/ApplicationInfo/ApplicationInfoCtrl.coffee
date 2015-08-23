controllerFunction = ($scope, $stateParams, ProjectApplication, ProjectRequirement, RequirementSubcategory, StudentAttribute, Project) ->



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


    $scope.processOffer = (approved) ->
        payload =
            approved: approved,
            id: $scope.application.id


        ProjectApplication.processOffer(payload).success((data) ->
            $scope.loadApplicationInfo()
        )


    $scope.loadApplicationInfo()




angular
.module('dcsupp')
.controller('ApplicationInfoCtrl', ['$scope', '$stateParams', 'ProjectApplication', 'ProjectRequirement', 'RequirementSubcategory', 'StudentAttribute', 'Project', controllerFunction])