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
controllerFunction = ($scope, $stateParams, Project, ProjectRequirement, RequirementSubcategory, $state, $q) ->
    # project info
    $scope.project = {}
    # project's student attribute subcategories
    $scope.project.requirements = []
    # project's non student attribute subcategories
    $scope.project.details = []

    #   true iff something on this page resulted in an error to alert error message
    $scope.error = false

    # save updated project and go to your_projects.project_info state
    $scope.patchProject = ->
        Project.patch($stateParams.id, $scope.project).success((data) ->
            $scope.error = false
            $state.go('your_projects.project_info', {id: $stateParams.id})
        ).error((data) ->
            $scope.error = true
        )


    # get current project information
    $scope.getProject = ->
        # get project obj with id $stateParams.id and store json into $scope.project
        Project.getById($stateParams.id).success((data) ->
            $scope.project = data
            dead = $scope.project.deadline_date
            $scope.project.deadline_date = new Date(parseInt(dead.substring(0, 4)), parseInt(dead.substring(5, 7)) - 1,
                    parseInt(dead.substring(8, 10))) #convert string repr of date to Javascript date

            # project's student attribute subcategories
            $scope.project.requirements = []
            # project's non student attribute subcategories
            $scope.project.details = []

            #   get project requirements
            $scope.loadStudentAttributeSubcategories()
            $scope.loadNonStudentAttributeSubcategories()
        )

    # get all student attribute subcategories and store in $scope.project.requirements
    $scope.loadStudentAttributeSubcategories = ()->
        RequirementSubcategory.getStudentAttributeSubcategoriesOfProject(project: $stateParams.id).success((data) ->
            for item in data
                $scope.project.requirements.push({name: item.sub_category_name, id: item.id})
        )

    # get all non-student attribute subcategories and store in $scope.project.requirements
    $scope.loadNonStudentAttributeSubcategories = ()->
        RequirementSubcategory.getNonStudentAttributeSubcategoriesOfProject(project: $stateParams.id).success((data) ->
            for item in data
                if item.attribute_type == 'Date'
                    item.value = new Date(parseInt(dead.substring(0, 4)), parseInt(dead.substring(5, 7)) - 1,
                        parseInt(dead.substring(8, 10))) #convert string repr of date to Javascript date
                $scope.project.details.push({name: item.sub_category_name, id: item.id, attribute_type: item.attribute_type, value: item.value})
        )

    # get all subcategories matching search term "query"
    $scope.loadTags = (query) ->
        deferred = $q.defer();
        RequirementSubcategory.studentAttributeRequirementSubcategoriesWithKeyword(keyword: query)
        .success((data) ->
            deferred.resolve(data.map((val) ->
                name: val.sub_category_name
                id: val.id
            )))
        return deferred.promise

    #	add additional detail to project
    $scope.addDetail = ->
    #	disallow duplicate detail items in list
        if !$scope.containedInDetails($scope.detailSelected)
            $scope.project.details.push($scope.detailSelected)

    #	check if given detail is already in list
    $scope.containedInDetails = (detail) ->
        for detailItem in $scope.project.details
            if detailItem.name == detail.name
                return true
        return false

    #	load non student attribute subcategories with name that contains viewValue for typeahead
    $scope.loadDetails = (viewValue) ->
        deferred = $q.defer();
        RequirementSubcategory.nonStudentAttributeRequirementSubcategoriesWithKeyword(keyword: viewValue)
        .success((data) ->
            deferred.resolve(data.map((val) ->
                name: val.sub_category_name
                id: val.id
                attribute_type: val.attribute_type
            )))
        return deferred.promise


    # run these functions when controller loads
    $scope.getProject()


angular
.module('dcsupp')
.controller('UpdateProjectCtrl',
    ['$scope', '$stateParams', 'Project', 'ProjectRequirement', 'RequirementSubcategory', '$state', '$q', controllerFunction])