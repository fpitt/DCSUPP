
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
        number_placeholder: ""
        number_max: 0
        number_min: 0
        #Case 2: Select Date
        maxDate: new Date()
        minDate: new Date()
        #Case 4: Select Input
        regex: ""
        input_placeholder: ""
        student_attribute: 0
    #Edit Subcategory
    $scope.edit_category = null
    #Global Empty => Empty Category used to reset the Input/ Edit Models
    $scope.GlobalDefault =
        #Global Category Name
        sub_category_name: ""
        attribute_type: "Number"
        #Case 1: Select Number
        number_placeholder: ""
        number_max: 0
        number_min: 0
        #Case 2: Select Date
        maxDate: new Date()
        minDate: new Date()
        #Case 4: Select Input
        regex: ""
        input_placeholder: ""
        student_attribute: 0

    # --- Edit SubCategory ---

    $scope.edit = (subcategory) ->
        $scope.edit_category = subcategory

    # --- Update SubCategory ---

    $scope.update = ->
        $scope.edit_category = null

    # --- Create SubCategory ---

    $scope.create_subcategory = ->
        #The Input Categories will be arranged Client-Sides
        input_upper_limit = null
        input_lower_limit = null
        input_placeholder = null
        console.log($scope.category.attribute_type)
        #Set the Client-Side Attributes
        if ($scope.category.attribute_type == "Number")
            input_upper_limit = $scope.category.number_max
            input_lower_limit = $scope.category.number_min
            input_placeholder = $scope.category.number_placeholder
        else if ($scope.category.attribute_type == "Date")
            input_upper_limit = $scope.category.maxDate
            input_lower_limit = $scope.category.minDate
        else if ($scope.category.attribute_type == "Input Field")
            input_placeholder = $scope.category.input_placeholder

        payload =
            subcategory:
                sub_category_name: $scope.category.sub_category_name
                attribute_type: $scope.category.attribute_type
                upper_limit: input_upper_limit
                lower_limit: input_lower_limit
                regex: $scope.category.regex
                placeholder: input_placeholder
                student_attribute: $scope.category.student_attribute
            target_id: $scope.current_category_id

        RequirementSubcategory.create(payload).success((data) ->
            $scope.category = angular.copy($scope.GlobalDefault)
            #Reset the Default category
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

