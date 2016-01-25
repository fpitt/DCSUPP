# ---------------------------------------------------------
# Page 5: Manage Cateogires Page
#
# This is the manage catogories page for the DCSUPP. Admins
# can dynamically add new project/ student categories which
# students can dynamically change their settings.
# ---------------------------------------------------------
angular
    .module('dcsupp')
    .controller 'ManageCategoryCtrl', ['$scope', 'RequirementCategory', 
        'RequirementSubcategory', 'User'
    ($scope, RequirementCategory, RequirementSubcategory, User) ->

        $scope.pagenumber = 1
        #Direction of the navigation
        $scope.direction = 0
        #List of Navigation Category
        $scope.categories = null
        #Create Requirement Category Model
        $scope.categoryName = ""
        #User Model
        $scope.user = null

        # --- Enable Success ---
        $scope.enable_success = ->
            $("#form_feedback").removeClass("has-error")
            $("#form_feedback").addClass("has-success")
            $("#input_label").text("Category Created")

        # --- Disable Success ---
        $scope.disable_success = (error_msg) ->
            $("#form_feedback").removeClass("has-success")
            $("#form_feedback").addClass("has-error")
            $("#input_label").text(error_msg)

        # --- Create Category --- 
        $scope.createCategory = ()->
            payload = 
                requirement_category:
                    category_name: $scope.categoryName
            RequirementCategory.create(payload)
                .success (data) ->
                    category_nameDefault = ""
                    $scope.categoryName = angular.copy(category_nameDefault)
                    $scope.flip(0)

                    if (data.msg)
                        $scope.disable_success(data.msg)
                    else
                        $scope.enable_success()

        # --- Category Navigation --- 
        $scope.flip = (pushDirection) ->
            payload = 
                direction: pushDirection
                pagenumber: $scope.pagenumber
            $scope.direction = pushDirection

            RequirementCategory.flip(payload).success((data) ->
                if (data)
                    $scope.categories = data
                    if $scope.direction > 0
                        $scope.pagenumber += 1
                    else if $scope.direction < 0
                        $scope.pagenumber -= 1
                    else
                        $scope.pagenumber = 1)
            $scope.getUser()

        # --- Get User ---
        $scope.getUser = ->
            User.getUser().success (data) ->
                $scope.user = data
            return

        # --- JQuery Initialization Code --- 
        $scope.flip(0)
    ]
