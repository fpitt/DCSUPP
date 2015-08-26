controllerFunction = ($scope, $stateParams, Project, ProjectRequirement, RequirementSubcategory) ->

    # project information
    $scope.project = {}

    $scope.setCompleted = ->
        payload = project: $stateParams.id
        Project.setCompleted(payload).success((projectInfo) ->
            $scope.getProject()
        )

    $scope.getProject = ->
        # get project object with id $stateParams.id
        Project.getById($stateParams.id).success((projectInfo) ->
            $scope.project = projectInfo
            dead = $scope.project.deadline_date
            # check if deadline date is due
            $scope.acceptingApplications = new Date(parseInt(dead.substring(0,4)), parseInt(dead.substring(5, 7)) - 1, parseInt(dead.substring(8,10))) >= new Date()

            # subcategories of this project that are student attributes
            $scope.project.studentAttributes = []
            # subcategories of this project that aren't student attributes
            $scope.project.nonStudentAttributes = []
            payload = project: $stateParams.id
            # get subcategories of this project
            ProjectRequirement.getByProject(payload).success((projectRequirements) ->
                for req in projectRequirements
                    RequirementSubcategory.getById(req.requirement_subcategory_id).success((subcategory) ->
                        if subcategory.student_attribute
                            $scope.project.studentAttributes.push(subcategory)
                        else
                            $scope.project.nonStudentAttributes.push(subcategory)
                    )
            )
        )


    #get project information when controller loads
    $scope.getProject()

angular
.module('dcsupp')
.controller('SelectedProjectCtrl', ['$scope', '$stateParams', 'Project', 'ProjectRequirement', 'RequirementSubcategory', controllerFunction])