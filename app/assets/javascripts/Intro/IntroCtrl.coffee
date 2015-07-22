angular.module('dcsupp').controller 'IntroCtrl', [
    '$scope'
    '$state'
    ($scope, $state) ->
        $scope.page = 'intro page'
        $state.go 'intro.1'
        return
]
