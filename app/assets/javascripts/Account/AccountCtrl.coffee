# -------------------------------------------------------------------------------------------------------
# Page 2: Account Page
#
# Summary:
# This is the Account Page for DCSUPP. It contains the student settings and allows students to change their
# personal information. The student settings can be added, removed or modified in the Manage Categories
# tab and all categories containing Student Settings are listed on the left and all subcategories within
# the categories that are student settings are listed on the right. The information is populated using
# angular $http calls and stored as scope variables.
#
# Page Placement [Referred to in the Comments]:
#
# [Left-Side]
# The Navigation panel with [prev][pagenumber][next]. The main categories are listed here.

# [Right-Side]
# The SubCategories within the main categories are listed here. SubCategories can be modified
#
# [Top-right]
# Popup button, displays the Information and Settings Popup menus.
# -------------------------------------------------------------------------------------------------------


AccountFunction = ($scope, $modal, modalService, requestService, User, $state, RequirementSubcategory, StudentAttribute) ->

    # --- Page Variables ----

    #Scope Variable Used in Popup Identification
    $scope.modalService = modalService

    # -- Track User/ Page State --
    #Javascript Object Storing Current User Information
    $scope.user = null
    #Page Number in Left-Side Navigation (Categories listed below Prev [pageNumber] Next)
    $scope.pagenumber = 1

    # -- List Navigation Category --
    #List of Categories in Left-Side Navigation
    $scope.categories = null
    #Current Selected Category in Left-Side Navigation
    $scope.selectCategory = null

    # -- SubCategory Attributes --
    #Current SubCategory Selected for Edit
    $scope.selectsubCategory = null
    #Requirement Attributes added by the User
    $scope.attribute_subcategory = []
    #List of all Requirement Attribute SubCategories
    $scope.subcategories = null
    #Merged List of Categories with attributes and empty categories [For Display]
    $scope.merged_category = []

    # -- Angular Models for Input/ Reset --
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
        console.log($scope.merged_category)
        #Check if we need to create/ update
        if $scope.studentAttributeCreated($scope.selectsubCategory.id)
            #Update the studentAttribute
            StudentAttribute.updateAttribute($scope.user.id, $scope.selectsubCategory.id, $scope.edit, $scope.selectCategory.id).success (data)->
                $scope.unselectEdit()
        else
            #Create the studentAttribute
            StudentAttribute.createAttribute($scope.user.id, $scope.selectsubCategory.id, $scope.edit, $scope.selectCategory.id).success (data)->
                $scope.unselectEdit()

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
    $scope.edit_entry = (id) ->
        $scope.edit = angular.copy($scope.editBlank)
        $scope.selectsubCategory = null

        for category in $scope.merged_category
            if (category.id == id)
                $scope.selectsubCategory = category
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

    $scope.updateProject = ->
        $state.go('update_project', {id: 1})

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

angular.module('dcsupp').controller('AccountCtrl', ['$scope',
                                                    '$modal', 'modalService', 'requestService', 'User', '$state',
                                                    'RequirementSubcategory', 'StudentAttribute', AccountFunction])