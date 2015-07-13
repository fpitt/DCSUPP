controllerFunction = ($scope, requestService) ->

    $scope.category_name = ""
    $scope.pagenumber = 1
    $scope.category_nameDefault = ""
    $scope.sendParams_category =
        method: 'POST'
        url: '/requirement_categories.json'


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

categoryListing = ->
    templateUrl: 'ManageCategory/CategoryPartial/_panel_listing.html'

angular
    .module('dcsupp')
    .controller('ManageCategoryCtrl', ['$scope', 'requestService', controllerFunction])
    .directive('subCategoryList', categoryListing)