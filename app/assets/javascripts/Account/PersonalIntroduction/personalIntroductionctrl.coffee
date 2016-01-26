# -------------------------------------------------------------------------------------------------------
# UI-View of the subcategoryListing
# -------------------------------------------------------------------------------------------------------

angular.module('dcsupp').controller 'PersonalIntroductionCtrl', ['$scope',
    'requestService', 'User', '$state', 'StudentAttribute', 
    ($scope, requestService, User, $state, StudentAttribute) ->

        #------------------------------------------------------
        #                   Scope Variables
        #------------------------------------------------------
        #   SINGLE OBJECT: Indicates if the Directive is for editing: Angular Construct
        $scope.edit = false

        #Edit SubCategory
        $scope.userInformation =
            contact_email: ""
            introduction: ""
            fullname: ""
            input_viewing: false

        #------------------------------------------------------
        #                   Scope Functions
        #------------------------------------------------------

        # --- Edit ---
        $scope.editEnable = ->
            $scope.edit = true

        # --- Update User ---
        # Update the User's Information
        $scope.updateUser = ->
            User.updateUser($scope.userInformation).success (data) ->
                $scope.getUser()
                $scope.edit = false
            return

        #------------------------------------------------------
        #              Initialization Functions
        #------------------------------------------------------

        # --- Get User --- (Initiaization Function: 1)
        # Grab the User Attribute
        $scope.getUser = ->
            User.getUser().success (data) ->
                $scope.user = data
                #Get Previous User Information
                $scope.userInformation.contact_email = $scope.user.contact_email
                $scope.userInformation.introduction = $scope.user.introduction
                $scope.userInformation.fullname = $scope.user.fullname
            return

        # --- Initialization ---
        $scope.getUser()
    ]   