angular.module('dcsupp').controller('IndexCtrl', ['$stateParams', '$scope', '$state', function ($stateParams,
                                                                                                $scope, $state) {
    if ($stateParams.goto != null) {

        var path = $stateParams.goto.split('/');
        var state = path[0];
        var state2 = path[0];
        var i;
        for (i = 1; i < path.length; i++) {
            state = state + '.' + path[i];
            if (i != path.length - 1) {
                state2 = state;
            };
        };

        try {
            $state.go(state);
        } catch (err) {
            try {
                $state.go(state2, {id: path[path.length - 1]});
            } catch (err2) {
            }
            ;
        }
        ;
    } else {
        $state.go('intro');
    };
}]);


