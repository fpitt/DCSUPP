angular.module('dcsupp').controller 'StudentAccountCtrl', [
    '$scope'
    '$modal'
    ($scope, $modal) ->
        $scope.page = 'manage category'
        $scope.items = [
            'item1'
            'item2'
            'item3'
        ]

        $scope.changeSettings = (size) ->
            modalInstance = $modal.open(
                animation: true
                templateUrl: 'StudentAccount/StudentAccountSettings/student_account_settings.html'
                controller: 'StudentAccountSettingsCtrl'
                size: size
                resolve: items: ->
                    $scope.items
            )
            modalInstance.result.then ((selectedItem) ->
                $scope.selected = selectedItem
                return
            ), ->
            return

        $scope.viewInfo = (size) ->
            modalInstance = $modal.open(
                animation: true
                templateUrl: 'StudentAccount/StudentAccountSettings/student_account_info.html'
                controller: 'StudentAccountSettingsCtrl'
                size: size
                resolve: items: ->
                    $scope.items
            )
            modalInstance.result.then ((selectedItem) ->
                $scope.selected = selectedItem
                return
            ), ->
            return

]