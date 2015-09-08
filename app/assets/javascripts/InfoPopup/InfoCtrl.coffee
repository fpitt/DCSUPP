angular.module('dcsupp').controller 'InfoCtrl', [
    '$scope'
    '$modalInstance'
    ($scope, $modalInstance) ->

        $scope.ok = ->
            $modalInstance.close()
            return
]