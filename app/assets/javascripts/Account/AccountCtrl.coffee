
# ---------------------------------------------------------
# Page 2: Account Page
#
# This is the Account Page for DCSUPP. It contains the
# student settings and allows students to change their 
# personal informations.
# ---------------------------------------------------------


AccountFunction = ($scope, $modal, modalService, requestService, User, $state, RequirementSubcategory) ->
        
    $scope.modalService = modalService

    # --- Page Variables ----
        
    $scope.items = [
        'item1'
        'item2'
        'item3'
    ]

    $scope.nameCollapsed = $scope.emailCollapsed = true
    $scope.user = {}
    $scope.pagenumber = 1
    $scope.categories = null
    #SubCategory Identication
    $scope.subcateogories = null
    $scope.selectCategory = null

    # --- Get User ---

    $scope.getUser = ->
        User.getUser().success((data) ->
            $scope.user = data
            $scope.payload = jQuery.extend(true, {}, data))
        return

    # --- Patch User --- 

    $scope.patchUser = ->
        patchSendParams =
            url: '/users/' + $scope.user.id + '.json'
            method: 'PATCH'
        requestService.service(patchSendParams, $scope.payload).success((data) ->
            $scope.getUser())
        return

    $scope.updateProject = ->
        $state.go('update_project', {id: 1})
    
    # --- Grab SubCategories ---

    $scope.loadSubcategories = (category)->
        payload =
            target_id: category.id

        $scope.selectCategory = category

        RequirementSubcategory.getAllOfCategory(payload).success((data) ->
            $scope.subcateogories = data)

    # --- Settings Navigation --- 

    $scope.flip = (pushDirection) ->
        payload = 
            direction: pushDirection
            pagenumber: $scope.pagenumber
        sendParams =
            method: 'POST'
            url: '/flip_student_settings.json'
        $scope.direction = pushDirection

        requestService.service(sendParams, payload).success(flipSuccess)

    flipSuccess = (data) ->
        if (data)
            $scope.categories = data
            if $scope.direction > 0
                $scope.pagenumber += 1
            else if $scope.direction < 0
                $scope.pagenumber -= 1
            else
                $scope.pagenumber = 1

    # --- Jquery Initialization --- 
    $scope.getUser()
    $scope.flip(0)

angular.module('dcsupp').controller('AccountCtrl', ['$scope',
    '$modal', 'modalService', 'requestService', 'User', '$state', 'RequirementSubcategory', AccountFunction])