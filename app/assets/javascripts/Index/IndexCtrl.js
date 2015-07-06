angular.module('dcsupp').controller('IndexCtrl', ['$stateParams', '$scope', '$state', function ($stateParams,
                                                                                                $scope, $state) {
    if ($stateParams.goto != null) {

        var path = $stateParams.goto.split('/');
        var state = path[0];
        var i;
        for (i = 1; i < path.length; i++) {
            state = state + '.' + path[i];
        };
        $state.go(state);
    } else {
        $state.go('intro');
    };
}]);


