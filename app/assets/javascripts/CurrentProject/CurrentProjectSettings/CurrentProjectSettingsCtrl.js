/**
 * Created by Christina on 2015-07-12.
 */
angular.module('dcsupp').controller('CurrentProjectSettingsCtrl', ['$scope', '$modalInstance','items', function ($scope, items, $modalInstance) {
    $scope.items = items;
    $scope.selected = {
        item: $scope.items[0]
    };

    $scope.ok = function () {
        $modalInstance.close($scope.selected.item);
    };

    $scope.cancel = function () {
        $modalInstance.dismiss('cancel');
    };
}]);
