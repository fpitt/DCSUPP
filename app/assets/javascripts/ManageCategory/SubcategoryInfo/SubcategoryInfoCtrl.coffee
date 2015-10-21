# ---------------------------------------------------------
# Page 5: Subcategory Info Page
#
# This is the subcategories page for the DCSUPP. Admins
# can dynamically add new project/ student subcategories which
# students can dynamically change their settings.
# ---------------------------------------------------------
controllerFunction = ($scope, $stateParams, RequirementCategory, RequirementSubcategory) ->

    #Store Category List
    $scope.list_subcategories = null
    #Edit Subcategory
    $scope.edit_category = null
    #Input Category    
    $scope.category =
        sub_category_name: ""
        attribute_type: "Number"
        placeholder: null
        regex: null
        student_attribute: false
    #Global Empty => Empty Category used to reset the Input/ Edit Models
    $scope.GlobalDefault =
        sub_category_name: ""
        attribute_type: "Number"
        placeholder: null
        regex: null
        student_attribute: false

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
    $scope.create_subcategory = (category)->
        input_upper_limit = null
        input_lower_limit = null
        input_placeholder = null
        #Set the Client-Side Attributes
        if (category.attribute_type == "Number")
            input_upper_limit = category.number_max
            input_lower_limit = category.number_min
            input_placeholder = category.number_placeholder
        else if (category.attribute_type == "Date")
            input_upper_limit = category.maxDate
            input_lower_limit = category.minDate
        else if (category.attribute_type == "Input Field")
            input_placeholder = category.input_placeholder
        console.log(category)

        payload =
            subcategory:
                sub_category_name: category.sub_category_name
                attribute_type: category.attribute_type
                upper_limit: input_upper_limit
                lower_limit: input_lower_limit
                regex: category.regex
                placeholder: input_placeholder
                student_attribute: category.student_attribute

        RequirementSubcategory.create(payload).success (data) ->
            #Reset the Default category
            $scope.category = angular.copy($scope.GlobalDefault)
            $scope.loadSubcategories()

    # --- Get SubCategory ---
    $scope.loadSubcategories = () ->
        RequirementSubcategory.getAllOfCategory(target_id: $stateParams.id).success((data) ->
            $scope.list_subcategories = data)

    # --- Controller Initialization --- 
    $scope.loadSubcategories()

angular
    .module('dcsupp')
    .controller('SubcategoryInfoCtrl', ['$scope', '$stateParams', 'RequirementCategory', 
    'RequirementSubcategory',  controllerFunction])

