controllerFunction = ($scope, $stateParams, Project, ProjectRequirement, RequirementSubcategory, $state) ->
    # store project info
    $scope.project = {}
    # store all subcategories that can be added to project
    $scope.subcategories = []

    # get current project information
    $scope.loadProject = ->
        # get project obj with id $stateParams.id and store json into $scope.project
        Project.getById($stateParams.id).success((data) ->
            $scope.project = data
            dead = $scope.project.deadline_date
            $scope.project.deadline_date = new Date(parseInt(dead.substring(0, 4)), parseInt(dead.substring(5, 7)) - 1,
                    parseInt(dead.substring(8, 10))) #convert string repr of date to Javascript date

            #create empty list to hold this project's subcategories
            $scope.project.subcategories = []
            payload = project: $stateParams.id
            ProjectRequirement.getByProject(payload).success((projectRequirements) -> # get project's subcategories
                for req in projectRequirements
                    RequirementSubcategory.getById(req.requirement_subcategory_id).success((subcategory) ->
                        $scope.project.subcategories.push({name: subcategory.sub_category_name, id: subcategory.id})
                    )
            )
        )


    # saved updated project and go to your_projects.project_info state
    $scope.patchProject = ->
        Project.patch($scope.project).success((data) ->
            $state.go('your_projects.project_info', {id: $stateParams.id})
        )


    # get all subcategories and store in $scope.subcategories
    $scope.loadSubcategories = ()->
        RequirementSubcategory.getAll().success((data) ->
            for item in data
                $scope.subcategories.push({name: item.sub_category_name, id: item.id})
        )

    # get all subcategories, used with ng tags input for adding subcategories
    $scope.loadTags = () ->
        return $scope.subcategories


    # run these functions when controller loads
    $scope.loadProject()
    $scope.loadSubcategories()

angular
.module('dcsupp')
.controller('UpdateProjectCtrl',
    ['$scope', '$stateParams', 'Project', 'ProjectRequirement', 'RequirementSubcategory', '$state', controllerFunction])