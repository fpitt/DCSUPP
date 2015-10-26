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
    #Category Error Objecy
    $scope.categoryError = ""
    #Input Category    
    $scope.category =
        sub_category_name: ""
        attribute_type: "Number"
        placeholder: ""
        regex: ""
        student_attribute: false
    #Global Empty => Empty Category used to reset the Input/ Edit Models
    $scope.GlobalDefault =
        sub_category_name: ""
        attribute_type: "Number"
        placeholder: ""
        regex: ""
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
    $scope.update = (category)->
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
        console.log(category)
        category.requirementCategory_id = parseInt($stateParams.id)

        RequirementSubcategory.create(category).success (data) ->
            #Reset the Default category
            if (data.status == 406)
                $scope.process(data.error)
            else
                $scope.categoryError = null
                $scope.category = angular.copy($scope.GlobalDefault)
                $scope.loadSubcategories()

    # --- Process Errors ---
    #Process the Errors according and display the Erros under the submit form
    $scope.process = (error) ->
        #Process for each Error
        error_obj = JSON.parse(error)
        if error_obj.sub_category_name
            $scope.categoryError = "Error: Subcategory name has already been taken"

    # --- Get SubCategory ---
    $scope.loadSubcategories = () ->
        RequirementSubcategory.getAllOfCategory(target_id: $stateParams.id).success (data) ->
            $scope.list_subcategories = data

    # --- Controller Initialization --- 
    $scope.loadSubcategories()

angular
    .module('dcsupp')
    .controller('SubcategoryInfoCtrl', ['$scope', '$stateParams', 'RequirementCategory', 
    'RequirementSubcategory',  controllerFunction])