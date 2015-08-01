controllerFunction = ($scope, requestService, modalService) ->

    #$scope.modalService = modalService

    # --- Page Variables ----

    $scope.pagenumber = 1
    $scope.direction = 0
    $scope.categories = null
    $scope.list_subcategories = null
    $scope.category_name = ""
    
    
    $scope.category =
        sub_category_name: ""
        attribute_type: "Number"
        placeholder: ""
        student_attribute: 0
    $scope.categoryDefault =
        sub_category_name: ""
        attribute_type: "Number"
        placeholder: ""
        student_attribute: 0


    $scope.sendParams_subcategory =
        method: 'POST'
        url: '/requirement_subcategories.json'


    $scope.getCSS = ->
        console.log("clicked")
        if $scope.category.student_attribute
            $scope.category.student_attribute = 0
            $("#student_attribute").addClass("btn-default").removeClass("btn-primary")
            $("#student_attribute").html("False")
        else
            $scope.category.student_attribute = 1
            $("#student_attribute").addClass("btn-primary").removeClass("btn-default")
            $("#student_attribute").html("True")


    successFunction2 = (data) ->
        console.log("success")
        clearForm2()

    clearForm2 = ->
        $scope.category.student_attribute = 0
        $("#student_attribute").addClass("btn-default").removeClass("btn-primary")
        $("#student_attribute").html("False")
        $scope.category = angular.copy($scope.categoryDefault)


    $scope.create_subcategory = ->
        $scope.payload_category = 
            requirement_subcategory:
                sub_category_name: $scope.category.sub_category_name
                attribute_type: $scope.category.attribute_type
                placeholder: $scope.category.placeholder
                student_attribute: $scope.category.student_attribute

        requestService.service($scope.sendParams_subcategory, $scope.payload_category).success(successFunction2)

    # --- Get SubCategory ---

    $scope.subcategories = (event)->
        payload = 
            target_id = event.target.id
        get_subcategories =
            method: 'POST'
            url: '/get_subcategories.json'

        requestService.service(get_subcategories, payload).success(getsubcategoriesSuccess)

    getsubcategoriesSuccess = (data) ->
        console.log(data)
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

