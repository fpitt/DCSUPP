# -------------------------------------------------------------------------------------------------------
# UI-View of the subcategoryListing
# -------------------------------------------------------------------------------------------------------
AttributeSubCategoryFunction = ($scope, $stateParams, $state, User,
        RequirementSubcategory, StudentAttribute) ->

    # -- Page Variable --
    $scope.user = null
    #Current SubCategory Selected for Edit
    $scope.selectsubCategory = null

    # -- SubCategories --
    #Requirement Attributes added by the User
    $scope.attribute_subcategory = []
    #List of all Requirement Attribute SubCategories
    $scope.subcategories = null
    #Merged List of Categories with attributes and empty categories [For Display]
    $scope.merged_category = []

    # -- Edit/Update Model --
    #Edit SubCategory
    $scope.edit =
        input_number: 0
        input_text: ""
        input_boolean: false
        input_date: new Date()
    #edit Global Blank
    $scope.editBlank =
        input_number: 0
        input_text: ""
        input_boolean: false
        input_date: new Date()

    # --- Merge Attribute + Categories ---
    # Merge the SubCategories with the student attributes for display purposes
    $scope.mergeCategories = ->
        #Emtpy the subcategories array
        $scope.merged_category.length = 0

        for category in $scope.subcategories
            #Filter out the none Student Attributes
            if category.student_attribute
                if $scope.studentAttributeCreated(category.id)
                    #The student Attribute is availble
                    append_category = $scope.studentAttributeCreated(category.id)
                    append_category.sub_category_name = category.sub_category_name
                    append_category.type = "attribute"
                    append_category.edit = false
                    $scope.merged_category.push(append_category)
                else
                    category.type = "category"
                    category.edit = false
                    $scope.merged_category.push(category)

    # --- Update Entry ---
    #Send the SubCategory Information to the backend
    $scope.update = ->
        StudentAttribute.createAttribute($scope.user.id, $scope.selectsubCategory.id, $scope.edit, $scope.selectCategory.id).success (data)->
            $scope.unselectEdit()
            $scope.userAttributes($scope.selectCategory.id)
    
    # --- Unselect Edit ---
    $scope.unselectEdit = ->
        #Change the Category Edit to false
        for category in $scope.merged_category
            if (category.edit)
                category.edit = false
        $scope.selectsubCategory = null
        $scope.edit = angular.copy($scope.editBlank)
        return

    # --- Edit Entry ---
    #Enable Editing for the selected SubCategory
    $scope.edit_entry = (subcategory) ->
        #If Attribute was previously created, set the default value
        $scope.edit = angular.copy($scope.editBlank)
        $scope.selectsubCategory = null

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

    # --- Get User ---
    #Grab the user Attribute
    $scope.getUser = ->
        User.getUser().success (data) ->
            $scope.user = data
        return

    # --- Grab User Settings ---
    $scope.userAttributes = (category_id)->
        StudentAttribute.getallUserAttribute($scope.user.id, category_id).success (data) ->
            $scope.attribute_subcategory = data
            $scope.mergeCategories()
        return

    # --- Grab SubCategories ---
    $scope.loadSubcategories = (category)->
        payload =
            target_id: category.id

        # Selected SubCategory
        $scope.selectCategory = category
        RequirementSubcategory.getAllOfCategory(payload).success (data) ->
            $scope.subcategories = data
            $scope.userAttributes(category.id)
        return

    # --- Check Student Attribute ---
    $scope.studentAttributeCreated = (attribute_id) ->
    #Iterate Over the Array [The Array is JSON]
        for key, category of $scope.attribute_subcategory
            if (category.requirement_subcategory_id == attribute_id)
                return category
        return false

    # --- Settings Navigation --- 
    $scope.flip = (pushDirection) ->
        payload =
            direction: pushDirection
            pagenumber: $scope.pagenumber
        $scope.direction = pushDirection
        StudentAttribute.flipStudentSettings(payload).success (data) ->
            if (data)
                $scope.categories = data
                if $scope.direction > 0
                    $scope.pagenumber += 1
                else if $scope.direction < 0
                    $scope.pagenumber -= 1
                else
                    $scope.pagenumber = 1
        return


    # --- Jquery Initialization --- 
    $scope.flip(0)
    $scope.getUser()

angular.module('dcsupp').controller('AttributeSubCategoryCtrl', 
    ['$scope','$stateParams', '$state', 'User',
    'RequirementSubcategory', 'StudentAttribute', AttributeSubCategoryFunction])