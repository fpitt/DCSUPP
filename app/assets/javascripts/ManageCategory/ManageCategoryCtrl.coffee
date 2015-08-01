controllerFunction = ($scope, requestService, modalService) ->

    #$scope.modalService = modalService

    # --- Page Variables ----

    $scope.pagenumber = 1
    $scope.direction = 0
    $scope.categories = null
    $scope.list_subcategories = null
    $scope.category_name = ""
    $scope.current_category_id = -1
    $scope.category =
        sub_category_name: ""
        attribute_type: "Number"
        placeholder: ""
        student_attribute: 0

    # --- Create SubCategory ---

    $scope.create_subcategory = ->
        payload_category = 
            subcategory:
                sub_category_name: $scope.category.sub_category_name
                attribute_type: $scope.category.attribute_type
                placeholder: $scope.category.placeholder
                student_attribute: $scope.category.student_attribute
            target_id: $scope.current_category_id
        sendParams_subcategory =
            method: 'POST'
            url: '/requirement_subcategories.json'

        requestService.service(sendParams_subcategory, payload_category).success(createsubSuccess)

    createsubSuccess = (data) ->
        categoryDefault =
            sub_category_name: ""
            attribute_type: "Number"
            placeholder: ""
            student_attribute: 0
        $scope.category = angular.copy(categoryDefault)

    # --- Get SubCategory ---

    $scope.subcategories = (event)->
        payload = 
            target_id: event.target.id
        get_subcategories =
            method: 'POST'
            url: '/get_subcategories.json'
        $scope.current_category_id = event.target.id

        requestService.service(get_subcategories, payload).success(getsubcategoriesSuccess)

    getsubcategoriesSuccess = (data) ->
        $scope.list_subcategories = data

    # --- Create Category --- 

    $scope.create_category = ->
        payload = 
            requirement_category:
                category_name: $scope.category_name
        sendParams_category =
            method: 'POST'
            url: '/requirement_categories.json'

        requestService.service(sendParams_category, payload).success(createCategorySuccess)

    createCategorySuccess = (data) ->
        category_nameDefault = ""
        $scope.category_name = angular.copy(category_nameDefault)

    # --- Category Navigation --- 

    $scope.flip = (pushDirection) ->
        payload = 
            direction: pushDirection
            pagenumber: $scope.pagenumber
        sendParams =
            method: 'POST'
            url: '/get_categories.json'
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

    # --- JQuery Initialization Code --- 

    $('[data-toggle="tooltip"]').tooltip()
    $scope.flip(0)

angular
    .module('dcsupp')
    .controller('ManageCategoryCtrl', ['$scope', 'requestService',  controllerFunction])

