angular.module('dcsupp').controller 'ListStudentSettingsCtrl', [
    '$scope'
    '$modalInstance'
    'items'
    ($scope, $modalInstance, items) ->
        $scope.items = items
        $scope.selected = item: $scope.items[0]

        $scope.ok = ->
            $modalInstance.close $scope.selected.item
            return

        $scope.cancel = ->
            $modalInstance.dismiss 'cancel'
            return
]