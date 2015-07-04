angular.module('dcsupp').controller('IndexCtrl', ['$stateParams', '$scope', '$state', function ($stateParams,
                                                                                                $scope, $state) {
    if ($stateParams.goto != null) {
        $state.go($stateParams.goto);
    } else {
        $state.go('intro');
    };
}]);


