angular.module('dcsupp').controller 'IndexCtrl', [
    '$stateParams'
    '$scope'
    '$state'
    ($stateParams, $scope, $state) ->
        if $stateParams.goto
            path = $stateParams.goto.split('/')
            state = path[0]
            state2 = path[0]
            i = undefined
            i = 1
            while i < path.length
                state = state + '.' + path[i]
                if i != path.length - 1
                    state2 = state
                i++
            try
                $state.go state
            catch err
                try
                    $state.go state2, id: path[path.length - 1]
                catch err2
        else
            $state.go 'intro'
]

