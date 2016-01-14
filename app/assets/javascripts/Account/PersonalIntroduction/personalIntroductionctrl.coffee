# -------------------------------------------------------------------------------------------------------
# UI-View of the subcategoryListing
# -------------------------------------------------------------------------------------------------------

angular.module('dcsupp').controller 'PersonalIntroductionCtrl', ['$scope',
    'requestService', 'User', '$state', 'StudentAttribute', 
    ($scope, requestService, User, $state, StudentAttribute) ->

        #Edit Mode on
        $scope.edit = false

        #Edit SubCategory
        $scope.userInformation =
            input_email: ""
            input_text: ""
            input_name: ""
            input_viewing: false

        # --- Edit ---
        $scope.editEnable = ->
            $scope.edit = true

        # --- Get User ---
        # Grab the User Attribute
        $scope.getUser = ->
            User.getUser().success (data) ->
                $scope.user = data
                #Get Previous User Information
                $scope.userInformation.input_email = $scope.user.contact_email
                $scope.userInformation.input_text = $scope.user.introduction
                $scope.userInformation.input_name = $scope.user.fullname
            return

        # --- Update User ---
        # Update the User's Information
        $scope.updateUser = ->
            User.updateUser($scope.userInformation).success (data) ->
                $scope.getUser()
                $scope.edit = false
            return

        # --- Jquery Initialization --- 
        $scope.getUser()
    ]   