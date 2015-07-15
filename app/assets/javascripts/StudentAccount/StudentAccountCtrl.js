angular.module('dcsupp').controller('StudentAccountCtrl', ['$scope', '$modal', function ($scope, $modal) {
    $scope.page = "student account";

    $scope.items = ['item1', 'item2', 'item3'];

    $scope.changeSettings = function (size) {

        var modalInstance = $modal.open({
            animation: true,
            templateUrl: 'StudentAccount/StudentAccountSettings/student_account_settings.html',
            controller: 'StudentAccountSettingsCtrl',
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