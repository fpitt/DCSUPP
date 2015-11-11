# ---------------------------------------------------------
# Page 5: Subcategory Info Page
#
# This is the subcategories page for the DCSUPP. Admins
# can dynamically add new project/ student subcategories which
# students can dynamically change their settings.
# ---------------------------------------------------------
controllerFunction = ($scope, $stateParams, RequirementCategory, RequirementSubcategory, User) ->

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

        #remove the unwanted variables
        delete $scope.edit_category.upper_limit
        delete $scope.edit_category.lower_limit

    # --- Check Min < Max Valid ---
    $scope.min_max_valid = () ->
        if ($scope.edit_category.attribute_type == "Number")
            if ($scope.edit_category.number_max <= $scope.edit_category.number_min)
                $scope.categoryError = "The Minimum Value cannot be 
                larger or equal to the Maximum Value"
                return false
        else if ($scope.edit_category.attribute_type == "Date")
            if ($scope.edit_category.maxDate <= $scope.edit_category.minDate)
                $scope.categoryError = "The earliest Date cannot be 
                earlier than the latest date"
                return false    
        return true

    # --- Update SubCategory ---
    $scope.update = ()->
        category.requirementCategory_id = parseInt($stateParams.id)
        checkValid = $scope.min_max_valid()
        console.log(checkValid)
        
        if (checkValid)
            RequirementSubcategory.update($scope.edit_category).success (data) ->
                #Reset the Update to Default
                if (data.status == 406)
                    $scope.process_update_error(data.error)
                else
                    $scope.categoryError = null
                    $scope.edit_category = null
                    $scope.loadSubcategories($scope.selectedCategory)

    # --- Create SubCategory ---
    $scope.create_subcategory = (category)->
        category.requirementCategory_id = parseInt($stateParams.id)

        RequirementSubcategory.create(category).success (data) ->
            #Reset the Default category
            if (data.status == 406)
                $scope.process_create_error(data.error)
            else
                $scope.categoryError = null
                $scope.category = angular.copy($scope.GlobalDefault)
                $scope.loadSubcategories()

    # --- Process Update Errors ---
    #Process the Errors according and display the Errors under the update form
    $scope.process_update_error = (error) ->
        #Process for each Error
        error_obj = JSON.parse(error)
        if error_obj.sub_category_name
            $scope.categoryError = "Error: Subcategory name has already been taken"

    # --- Process Create Errors ---
    #Process the Errors according and display the Errors under the submit form
    $scope.process_create_error = (error) ->
        #Process for each Error
        error_obj = JSON.parse(error)
        if error_obj.sub_category_name
            $scope.categoryError = "Error: Subcategory name has already been taken"

    # --- Get SubCategory ---
    $scope.loadSubcategories = () ->
        RequirementSubcategory.getAllOfCategory(target_id: $stateParams.id).success (data) ->
            $scope.list_subcategories = data

    # --- Get User ---
    $scope.getUser = ->
        User.getUser().success (data) ->
            $scope.user = data
        return

    # --- Controller Initialization --- 
    $scope.loadSubcategories()
    $scope.getUser()

angular
    .module('dcsupp')
    .controller('SubcategoryInfoCtrl', ['$scope', '$stateParams', 'RequirementCategory', 
    'RequirementSubcategory', 'User', controllerFunction])

controllerFunction.$injector = ['$scope', '$stateParams', 'RequirementCategory', 
    'RequirementSubcategory', 'User']