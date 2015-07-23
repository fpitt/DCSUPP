angular.module('dcsupp').controller 'IntroCtrl', [
    '$scope'
    '$state'
    ($scope, $state) ->
        $scope.page = 'intro page'
        console.log($.cache)
        $state.go 'intro.1'
        return
]
