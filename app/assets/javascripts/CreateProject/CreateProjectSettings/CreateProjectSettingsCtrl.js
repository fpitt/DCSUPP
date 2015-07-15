angular.module('dcsupp').controller('CreateProjectSettingsCtrl', ['$scope', '$modalInstance', function ($scope, $modalInstance) {

    $scope.ok = function () {
        $modalInstance.close('ok');
    };

    $scope.cancel = function () {
        $modalInstance.dismiss('cancel');
    };
}]);
