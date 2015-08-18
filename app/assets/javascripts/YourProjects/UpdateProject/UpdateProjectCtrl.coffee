controllerFunction = ($scope, $stateParams, Project, ProjectRequirement, RequirementSubcategory, $state) ->
    $scope.project = {basicInfo: {}, subcategories: []}
    $scope.subcategories = []

    $scope.loadProject = ->
        Project.getById($stateParams.id).success((data) ->
            $scope.project.basicInfo = data
            dead = $scope.project.basicInfo.deadline_date
            $scope.project.basicInfo.deadline_date = new Date(parseInt(dead.substring(0, 4)), parseInt(dead.substring(5, 7)) - 1,
                    parseInt(dead.substring(8, 10)))
        )

        payload = project: $stateParams.id
        ProjectRequirement.getByProject(payload).success((projectRequirements) ->
            for req in projectRequirements
                RequirementSubcategory.getById(req.requirement_subcategory_id).success((subcategory) ->
                        $scope.project.subcategories.push({name: subcategory.sub_category_name, id: subcategory.id})
                )
        )


    $scope.patchProject = ->
        Project.patch($scope.project).success((data) ->
            $state.go('your_projects.project_info', {id: $stateParams.id})
        )

    $scope.loadSubcategories = ()->
        RequirementSubcategory.getAll().success((data) ->
            for item in data
                $scope.subcategories.push({name: item.sub_category_name, id: item.id})
        )

    $scope.loadTags = () ->
        return $scope.subcategories


    $scope.loadProject()
    $scope.loadSubcategories()

angular
.module('dcsupp')
.controller('UpdateProjectCtrl',
    ['$scope', '$stateParams', 'Project', 'ProjectRequirement', 'RequirementSubcategory', '$state', controllerFunction])