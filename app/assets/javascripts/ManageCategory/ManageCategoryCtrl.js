angular.module('dcsupp').controller('ManageCategoryCtrl', ['$scope', '$modal', function ($scope, $modal) {
    $scope.page = "manage category";

    $scope.items = ['item1', 'item2', 'item3'];

    $scope.changeSettings = function (size) {

        var modalInstance = $modal.open({
            animation: true,
            templateUrl: 'ManageCategory/ManageCategorySettings/manage_category_settings.html',
            controller: 'ManageCategorySettingsCtrl',
            size: size,
            resolve: {
                items: function () {
                    return $scope.items;
                }
            }
        });

        modalInstance.result.then(function (selectedItem) {
            $scope.selected = selectedItem;
        }, function () {
        });
    };
}]);