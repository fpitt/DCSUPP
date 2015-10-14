# -------------------------------------------------------------------------------------------------------
# UI-View of the subcategoryListing
# -------------------------------------------------------------------------------------------------------


PersonalIntroductionFunction = ($scope, $modal, modalService, requestService, User, $state, StudentAttribute) ->

    #Edit SubCategory
    $scope.userInformation =
        input_email: ""
        input_text: ""

    #Edit SubCategory Empty
    $scope.userInformationBlank =
        input_email: ""
        input_text: ""   

    # --- Get User ---
    #Grab the user Attribute
    $scope.getUser = ->
        User.getUser().success (data) ->
            $scope.user = data
        return

    # --- Update User ---
    $scope.updateUser = ->
        User.updateUser($scope.user.id, $scope.userInformation).success (data) ->
            $scope.edit = angular.copy($scope.userInformationBlank)
        return

    # --- Jquery Initialization --- 
    $scope.getUser()

angular.module('dcsupp').controller('AttributeSubCategoryCtrl', ['$scope',
                                                    '$modal', 'modalService', 'requestService', 'User', '$state',
                                                    'StudentAttribute', PersonalIntroductionFunction])