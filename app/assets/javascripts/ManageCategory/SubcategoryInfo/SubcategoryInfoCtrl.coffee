
# ---------------------------------------------------------
# Page 5: Subcategory Info Page
#
# This is the subcategories page for the DCSUPP. Admins
# can dynamically add new project/ student subcategories which
# students can dynamically change their settings.
# ---------------------------------------------------------


controllerFunction = ($scope, $stateParams, RequirementCategory, modalService, RequirementSubcategory) ->

    $scope.modalService = modalService

    # --- Page Variables ----

    #Store Category List
    $scope.list_subcategories = null

    $scope.category =
        sub_category_name: ""
        attribute_type: "Number"
        placeholder: ""
        regex: ""
        student_attribute: 0
    #Edit Subcategory
    $scope.edit_category = null
    #Global Empty => Empty Category used to reset the Input/ Edit Models
    $scope.GlobalDefault =
        sub_category_name: ""
        attribute_type: "Number"
        placeholder: ""
        regex: ""
        student_attribute: 0

    # --- Edit SubCategory ---

    $scope.edit = (subcategory) ->
        $scope.edit_category = subcategory
        if ($scope.edit_category.attribute_type == 'Number')
            $scope.edit_category.number_max = parseInt(subcategory.upper_limit)
            $scope.edit_category.number_min = parseInt(subcategory.lower_limit)
        if ($scope.edit_category.attribute_type == 'Date')
            $scope.edit_category.maxDate = new Date()
            $scope.edit_category.minDate = new Date()

    # --- Update SubCategory ---

    $scope.update = ->
        payload =
            sub_category_name: $scope.category.sub_category_name
            attribute_type: $scope.category.attribute_type
            upper_limit: input_upper_limit
            lower_limit: input_lower_limit
            regex: $scope.category.regex
            placeholder: input_placeholder
            student_attribute: $scope.category.student_attribute

        RequirementSubcategory.update(payload).success (data) ->
            $scope.edit_category = null
            #Reload the Current SubCategory with the Updates
            $scope.loadSubcategories($scope.selectedCategory)

    # --- Create SubCategory ---

    $scope.create_subcategory = ->
#The Input Categories will be arranged Client-Sides
        input_upper_limit = null
        input_lower_limit = null
        input_placeholder = null
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
            $scope.loadSubcategories($scope.selectedCategory))

    # --- Get SubCategory ---

    $scope.loadSubcategories = () ->
        RequirementSubcategory.getAllOfCategory(target_id: $stateParams.id).success((data) ->
            $scope.list_subcategories = data)


    # run this code when controller loads
    $scope.loadSubcategories()

angular
.module('dcsupp')
.controller('SubcategoryInfoCtrl', ['$scope', '$stateParams', 'RequirementCategory', 'modalService', 'RequirementSubcategory',  controllerFunction])

