angular.module('dcsupp').controller('IndexCtrl', ['$stateParams', '$scope', '$state', function ($stateParams,
                                                                                                $scope, $state) {
    if ($stateParams.goto != null) {

        var path = $stateParams.goto.split('/');
        var state = path[0];
        var i;
        for (i = 1; i < path.length - 1; i++) {
            state = state + '.' + path[i];
        };

        if (path[path.length - 1].indexOf('?') > -1 ) {
            state = state + '.' +  path[path.length-1].substring(0, path[path.length - 1].indexOf('?')) + '{' +
                path[path.length-1].substring(path[path.length - 1].indexOf('?') + 1,
                    path[path.length - 1].indexOf('='))
                +
                path[path.length-1].substring(path[path.length - 1].indexOf('=') + 1, path[path.length-1].length) +'}';
        } else {
            state = state + '.' + path[path.length - 1];
        };


        $state.go(state);
    } else {
        $state.go('intro');
    };
}]);


