angular.module('dcsupp').controller 'CreateProjectSettingsCtrl', [
    '$scope'
    '$modalInstance'
    ($scope, $modalInstance) ->

        $scope.ok = ->
            $modalInstance.close 'ok'
            return

        $scope.cancel = ->
            $modalInstance.dismiss 'cancel'
            return
]
