
# ---------------------------------------------------------
# Page 5: Manage Cateogires Page
#
# This is the manage catogories page for the DCSUPP. Admins
# can dynamically add new project/ student categories which
# students can dynamically change their settings.
# ---------------------------------------------------------


controllerFunction = ($scope, RequirementCategory, RequirementSubcategory) ->

    #$scope.modalService = modalSDaervice

    # --- Page Variables ----

    $scope.pagenumber = 1
    $scope.direction = 0
    #Store Category List
    $scope.categories = null
    $scope.list_subcategories = null
    #Category Identification
    $scope.category_name = ""
    $scope.current_category_id = -1
    $scope.category =
        #Global Category Name
        sub_category_name: ""
        attribute_type: "Number"
        #Case 1: Select Number
        number_placerholder: ""
        number_max: 0
        number_min: 0
        #Case 2: Select Date
        maxDate: "yyyy-MM-dd"
        minDate: "yyyy-MM-dd"
        #Case 4: Select Input
        regex: ""
        input_placeholder: ""
        student_attribute: 0

    # --- Create SubCategory ---

    $scope.create_subcategory = ->
        payload =
            subcategory:
                sub_category_name: $scope.category.sub_category_name
                attribute_type: $scope.category.attribute_type
                placeholder: $scope.category.placeholder
                student_attribute: $scope.category.student_attribute
            target_id: $scope.current_category_id

        RequirementSubcategory.create(payload).success((data) ->
            categoryDefault =
                #Global Category Name
                sub_category_name: ""
                attribute_type: "Number"
                #Case 1: Select Number
                number_placerholder: ""
                number_max: 0
                number_min: 0
                #Case 2: Select Date
                maxDate: "yyyy-MM-dd"
                minDate: "yyyy-MM-dd"
                #Case 4: Select Input
                regex: ""
                input_placeholder: ""
                student_attribute: 0
            $scope.category = angular.copy(categoryDefault)
            $scope.loadSubcategories($scope.current_category_id))

    # --- Get SubCategory ---

    $scope.loadSubcategories = (id)->
        payload =
            target_id: id
        $scope.current_category_id = id

        RequirementSubcategory.getAllOfCategory(payload).success((data) ->
            $scope.list_subcategories = data)

    # --- Create Category --- 

    $scope.createCategory = ->
        payload = 
            requirement_category:
                category_name: $scope.category_name
        RequirementCategory.create(payload).success((data) ->
            category_nameDefault = ""
            $scope.category_name = angular.copy(category_nameDefault)
            $scope.flip(0))

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

    # --- JQuery Initialization Code --- 

    $('[data-toggle="tooltip"]').tooltip()
    $scope.flip(0)

angular
    .module('dcsupp')
    .controller('ManageCategoryCtrl', ['$scope', 'RequirementCategory', 'RequirementSubcategory',  controllerFunction])

