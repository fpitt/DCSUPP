controllerFunction = ($scope, requestService) ->

    $scope.category_name = ""
    $scope.pagenumber = 1
    $scope.category_nameDefault = ""
    $scope.sendParams_category =
        method: 'POST'
        url: '/requirement_categories.json'
    $scope.button_clicked = 0


    $scope.getCSS = ->
        console.log("clicked")
        if $scope.button_clicked
            $scope.button_clicked = 0
            $("#student_attribute").addClass("btn-default").removeClass("btn-primary")
            $("#student_attribute").html("False")
        else
            $scope.button_clicked = 1
            $("#student_attribute").addClass("btn-primary").removeClass("btn-default")
            $("#student_attribute").html("True")


    successFunction = (data) ->
        console.log("success")
        clearForm()


    clearForm = ->
        $scope.category_name = angular.copy($scope.category_nameDefault)


    $scope.create_category = ->
        $scope.payload_category = 
            requirement_category:
                category_name: $scope.category_name

        requestService.service($scope.sendParams_category, $scope.payload_category).success(successFunction)

    $('[data-toggle="tooltip"]').tooltip()


angular
    .module('dcsupp')
    .controller('ManageCategoryCtrl', ['$scope', 'requestService', controllerFunction])