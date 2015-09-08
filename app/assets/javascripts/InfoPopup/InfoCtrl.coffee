angular.module('dcsupp').controller 'InfoCtrl', [
    '$scope'
    '$modalInstance'
    ($scope, $modalInstance) ->

        $scope.ok = ->
            $modalInstance.close $scope.selected.item
            return
]