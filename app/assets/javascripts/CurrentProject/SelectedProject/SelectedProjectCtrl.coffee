controllerFunction = ($scope, $stateParams, Project, ProjectRequirement, RequirementSubcategory) ->

    $scope.project = {basicInfo: {}, subcategories: [], requirements: []}
    $scope.today = new Date()

    $scope.loadProject = ->
        Project.getById($stateParams.id).success((data) ->
            $scope.project.basicInfo = data)

        payload = project: $stateParams.id
        ProjectRequirement.getByProject(payload).success((projectRequirements) ->
            for req in projectRequirements
                RequirementSubcategory.getById(req.requirement_subcategory_id).success((subcategory) ->
                    if subcategory.student_attribute
                            $scope.project.requirements.push(subcategory)
                    else
                        $scope.project.subcategories.push(subcategory)
                    )
                )

    $scope.loadProject()

angular
.module('dcsupp')
.controller('SelectedProjectCtrl', ['$scope', '$stateParams', 'Project', 'ProjectRequirement', 'RequirementSubcategory', controllerFunction])