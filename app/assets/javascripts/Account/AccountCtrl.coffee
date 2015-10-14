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
# Nested View to update student information. Check folder[Accountsubcategory] for the nested view
# -------------------------------------------------------------------------------------------------------


AccountFunction = ($scope, $modal, modalService, requestService, $state, User, RequirementSubcategory, StudentAttribute) ->

    # --- Page Variables ----
    #Scope Variable Used in Popup Identification
    $scope.modalService = modalService

    # -- Track User/ Page State --
    #Page Number in Left-Side Navigation (Categories listed below Prev [pageNumber] Next)
    $scope.pagenumber = 1
    #List of Categories in Left-Side Navigation
    $scope.categories = null
    #Flip Direction[Used to Evaluate the edge case]
    $scope.direction = 0

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

angular.module('dcsupp').controller('AccountCtrl', ['$scope',
                                                    '$modal', 'modalService', 'requestService', 'User', '$state',
                                                    'RequirementSubcategory', 'StudentAttribute', AccountFunction])