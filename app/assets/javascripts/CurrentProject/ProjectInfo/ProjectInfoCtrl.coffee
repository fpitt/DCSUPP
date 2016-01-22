# -------------------------------------------------------------------------------------------------------
# Page: Project Info Page
#
# Summary:
# This is the Project Info page for DCSUPP. It displays
# information about a specific project.
# On this page:
#   - Professors have the ability to set a project as being completed, and edit project information.
#   - Students have the ability to submit a project application.
#
# Page Placement [Referred to in the Comments]:
# [Left]
# Project navigation
#
# [Middle]
# Information about a specific project (users can select to view project information by
# clicking on a project from the navigation on the left).
#
# [Top-right]
# Popup button, displays the Information and Settings Popup menus.
# -------------------------------------------------------------------------------------------------------
angular
.module('dcsupp')
.controller 'ProjectInfoCtrl', ['$scope', '$stateParams', 'Project', 
    'ProjectRequirement', 'RequirementSubcategory', 'User', 'ProjectApplication',
    ($scope, $stateParams, Project, ProjectRequirement, RequirementSubcategory, User, ProjectApplication) ->
        #   project information
        $scope.project = {}
        #   Project  Requirements
        $scope.requirements = []
        #User Model
        $scope.user = null
        #Professor Model
        $scope.professor = null
        #Applications submitted to the project (for administrators)
        $scope.applications = null

        #   set this project as being completed
        $scope.setCompleted = ->
            payload = project: $stateParams.id
            Project.setCompleted(payload).success((projectInfo) ->
                $scope.getProject()
                $scope.getInProgressProjects()
            )

        #   get project information
        $scope.getProject = ->
            #   get project object with id $stateParams.id
            Project.getById($stateParams.id).success (projectInfo) ->
                $scope.project = projectInfo
                dead = $scope.project.deadline_date
                #   check if deadline date is due
                $scope.acceptingApplications = new Date(parseInt(dead.substring(0,4)), parseInt(dead.substring(5, 7)) - 1, parseInt(dead.substring(8,10))) >= new Date()
                #   get all non student attribute subcategories of this project
                RequirementSubcategory.getNonStudentAttributeSubcategoriesOfProject(project: $stateParams.id).success((data) ->
                    $scope.details = data
                )
                $scope.getByProject()
                $scope.getProfessor()
                $scope.getApplications()

        $scope.getApplications = ->
            payload = 
                id: $scope.project.id
            ProjectApplication.getByProject(payload).success (data) ->
                console.log(data)
                $scope.applications = data

        $scope.getByProject = ->
            ProjectRequirement.getByProject($scope.project).success (data) ->
                $scope.requirements = data

        $scope.getProfessor = ->
            User.getById($scope.project.user_id).success (user) ->
                $scope.professor = user

        # --- Get User ---
        $scope.getUser = ->
            User.getUser().success (data) ->
                $scope.user = data
            return

        #   get project information when controller loads
        $scope.getProject()
        $scope.getUser()
        
    ]
