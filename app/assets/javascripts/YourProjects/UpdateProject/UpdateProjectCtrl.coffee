# -------------------------------------------------------------------------------------------------------
# Page: Update Project Page
#
# Summary:
# This is the update project page for DCSUPP for professors
# to add changes to their project information.
#
# Page Placement [Referred to in the Comments]:
#
# [Top-right]
# Popup button, displays the Information and Settings Popup menus.
# -------------------------------------------------------------------------------------------------------
angular
.module('dcsupp')
.controller 'UpdateProjectCtrl',
    ['$scope', '$stateParams', 'Project', 'User', '$state', '$q', 
    ($scope, $stateParams, Project, User, $state, $q) ->

        #   project info
        $scope.project = {}
        #   User Object
        $scope.user = null

        # save updated project and go to your_projects.project_info state
        $scope.patchProject = ->
            Project.patch($stateParams.id, $scope.project).success (data) ->
                if ($scope.user.administrator)
                    $state.go('current_project.project_info', {id: $stateParams.id})
                else
                    $state.go('your_projects.project_info', {id: $stateParams.id})


        # get current project information
        $scope.getProject = ->
            # get project obj with id $stateParams.id and store json into $scope.project
            Project.getById($stateParams.id).success((data) ->
                $scope.project = data
                dead = $scope.project.deadline_date
                $scope.project.deadline_date = new Date(parseInt(dead.substring(0, 4)), parseInt(dead.substring(5, 7)) - 1,
                        parseInt(dead.substring(8, 10))) #convert string repr of date to Javascript date
            )

        # --- Get User --- (Initiaization Function: 1)
        $scope.getUser = ->
            User.getUser().success (data) ->
                $scope.user = data
            return

        # --- Initialization ---
        $scope.getUser()
        $scope.getProject()
    ]