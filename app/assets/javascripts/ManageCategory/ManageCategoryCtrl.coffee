controllerFunction = ($scope, requestService) ->

    $scope.pagenumber = 2
    $scope.categories = null
    $scope.subcategories = null

    $scope.category_name = ""
    $scope.category_nameDefault = ""

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

    $scope.pagenumber = 1
    $scope.sendParams_category =
        method: 'POST'
        url: '/requirement_categories.json'
    $scope.sendParams_subcategory =
        method: 'POST'
        url: '/requirement_subcategories.json'
    $scope.sendParams =
        method: 'POST'
        url: '/get_categories.json'
    $scope.get_subcategories =
        method: 'POST'
        url: '/get_subcategories.json'
    $scope.payload = 
        category:
            title: "testtitle"
            description: "test description"


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


    successFunction = (data) ->
        console.log("success")
        clearForm()

    successFunction2 = (data) ->
        console.log("success")
        clearForm2()

    successFunction3 = (data) ->
        console.log("success")
        $scope.categories = data

    successFunction4 = (data) ->
        console.log(data)
        $scope.subcategories = data

    clearForm = ->
        $scope.category_name = angular.copy($scope.category_nameDefault)

    clearForm2 = ->
        $scope.category.student_attribute = 0
        $("#student_attribute").addClass("btn-default").removeClass("btn-primary")
        $("#student_attribute").html("False")
        $scope.category = angular.copy($scope.categoryDefault)


    $scope.create_category = ->
        $scope.payload_category = 
            requirement_category:
                category_name: $scope.category_name

        requestService.service($scope.sendParams_category, $scope.payload_category).success(successFunction)

    $scope.create_subcategory = ->
        $scope.payload_category = 
            requirement_subcategory:
                sub_category_name: $scope.category.sub_category_name
                attribute_type: $scope.category.attribute_type
                placeholder: $scope.category.placeholder
                student_attribute: $scope.category.student_attribute

        requestService.service($scope.sendParams_subcategory, $scope.payload_category).success(successFunction2)

    $scope.flip = (pushDirection) ->
        $scope.payload["direction"] = pushDirection

        requestService.service($scope.sendParams, $scope.payload).success(successFunction3)

    $scope.subcategories = (event)->
        console.log(event.target.id)
        $scope.payload["target_id"] = event.target.id

        requestService.service($scope.get_subcategories, $scope.payload).success(successFunction4)

    $('[data-toggle="tooltip"]').tooltip()
    $scope.flip(0)


angular
    .module('dcsupp')
    .controller('ManageCategoryCtrl', ['$scope', 'requestService', controllerFunction])