# -------------------------------------------------------------------------------------------------------
# UI-View of the subcategoryListing
# -------------------------------------------------------------------------------------------------------
AttributeSubCategoryFunction = ($scope, $stateParams, $state, User,
        RequirementSubcategory, RequirementCategory, StudentAttribute) ->

    ### ----------------------------- Page Variables ----------------------------- ###

    #Current SubCategory selected for Edit
    $scope.category = null
    #Requirement Attributes added by the User
    $scope.attribute_subcategory = []
    #List of all Requirement Attribute SubCategories within the Category
    $scope.subcategories = null
    #Merged List of Categories with attributes and empty categories [For Display]
    $scope.merged_category = []
    #Category Currently Edited
    $scope.edit_subcategory = null
    #Selected SubCategory Parameter list
    $scope.selectsubCategory = null

    # -- Edit/Update Model --
    #Edit SubCategory
    $scope.edit =
        input_number: null
        input_text: null
        input_boolean: false
        input_date: new Date()
    #edit Global Blank
    $scope.editBlank =
        input_number: null
        input_text: null
        input_boolean: false
        input_date: new Date()

    # --- Update Entry ---
    #Send the SubCategory Information to the backend
    $scope.update = ()->
        $scope.edit.subcategory_id = $scope.edit_subcategory.requirement_subcategory_id
        $scope.edit.category_id = $scope.edit_subcategory.requirement_category_id

        StudentAttribute.createAttribute($scope.edit).success (data)->
            $scope.unselectEdit()
    
    # --- Unselect Edit ---
    $scope.unselectEdit = ->
        #Change the Category Edit to false
        for category in $scope.merged_category
            if (category.edit)
                category.edit = false
        $scope.edit = angular.copy($scope.editBlank)
        $scope.getCategory()
        return

    # --- Edit Entry ---
    #Enable Editing for the selected SubCategory
    $scope.edit_entry = (subcategory) ->
        #If Attribute was previously created, set the default value
        $scope.edit = angular.copy($scope.editBlank)
        $scope.selectsubCategory = null
        $scope.edit_subcategory = subcategory
        console.log($scope.edit_subcategory)

        if (subcategory.type == 'attribute')
            #Set the selected is an attribute
            for category in $scope.subcategories
                if (category.id == subcategory.requirement_subcategory_id)
                    $scope.selectsubCategory = category

            #Set the Edit to the previous default value
            if ($scope.selectsubCategory.attribute_type == "Number")
                $scope.edit.input_number = parseInt(subcategory.value)
            else if ($scope.selectsubCategory.attribute_type == "Date")
                $scope.edit.input_date = new Date()
            else if ($scope.selectsubCategory.attribute_type == "Boolean")
                if (subcategory.value == 't')
                    $scope.edit.input_boolean = true
                else
                    $scope.edit.input_boolean = false
            else if ($scope.selectsubCategory.attribute_type == "Input Field")
                $scope.edit.input_text = subcategory.value
        else
            #Select is a category
            for category in $scope.subcategories
                if (category.id == subcategory.id)
                    $scope.selectsubCategory = category

        #Set the attribute to edit true
        for category in $scope.merged_category
            if (category.id == subcategory.id)
                category.edit = true
            else if (category.edit)
                category.edit = false

        return

    ### ---------------------------- Variable Initialization ---------------------------- ###
   
    # --- Check Student Attribute ---
    $scope.student_attribute_available = (attribute_id) ->
    #Iterate Over the Array [The Array is JSON]
        for key, category of $scope.attribute_subcategory
            if (category.requirement_subcategory_id == attribute_id)
                return category
        return false

    # --- Merge Attribute + Categories ---
    # Merge the SubCategories with the student attributes for display purposes
    $scope.mergeCategories = ->
        #Emtpy the subcategories array
        if $scope.merged_category
            $scope.merged_category.length = 0

        for category in $scope.subcategories
            #Filter out the none Student Attributes
            if category.student_attribute
                if $scope.student_attribute_available(category.id)
                    #The student Attribute is availble
                    append_category = $scope.student_attribute_available(category.id)
                    append_category.sub_category_name = category.sub_category_name
                    append_category.type = "attribute"
                    append_category.edit = false
                    $scope.merged_category.push(append_category)
                else
                    category.type = "category"
                    category.edit = false
                    $scope.merged_category.push(category)

    # --- Grab User Settings ---
    $scope.userAttributes = (category)->
        StudentAttribute.getallUserAttribute(category.id).success (data) ->
            $scope.attribute_subcategory = data
            $scope.mergeCategories()
        return

    # --- Get SubCategory ---
    $scope.getCategory = ->
        payload =
            id: $stateParams.id
        RequirementCategory.category(payload).success (data) ->
            $scope.category = data
            $scope.loadSubcategories($scope.category)
            
        return

    # --- Grab SubCategories ---
    $scope.loadSubcategories = (category)->
        payload =
            target_id: category.id
        RequirementSubcategory.getAllOfCategory(payload).success (data) ->
            $scope.subcategories = data
            $scope.userAttributes($scope.category)
        return

    # --- Jquery Initialization ---
    #The program will only initiate a new JSON call after the previous variable
    #has been retrived. This is to avoid race conditions.
    $scope.getCategory()

angular.module('dcsupp').controller('AttributeSubCategoryCtrl', 
    ['$scope','$stateParams', '$state', 'User','RequirementSubcategory', 
    'RequirementCategory', 'StudentAttribute', AttributeSubCategoryFunction])