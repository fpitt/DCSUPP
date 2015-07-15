angular.module('dcsupp').controller 'ListStudentCtrl', [
    '$scope'
    '$modal'
    ($scope, $modal) ->
        $scope.items = [
            'item1'
            'item2'
            'item3'
        ]
        $scope.animationsEnabled = true

        $scope.changeSettings = (size) ->
            modalInstance = $modal.open(
                animation: $scope.animationsEnabled
                templateUrl: 'ListStudent/ListStudentSettings/list_student_settings.html'
                controller: 'ListStudentSettingsCtrl'
                size: size
                resolve: items: ->
                    $scope.items
            )
            modalInstance.result.then ((selectedItem) ->
                $scope.selected = selectedItem
                return
            ), ->
                $log.info 'Modal dismissed at: ' + new Date
                return

        $scope.viewInfo = (size) ->
            modalInstance = $modal.open(
                animation: $scope.animationsEnabled
                templateUrl: 'ListStudent/ListStudentSettings/list_student_info.html'
                controller: 'ListStudentSettingsCtrl'
                size: size
                resolve: items: ->
                    $scope.items
            )
            modalInstance.result.then ((selectedItem) ->
                $scope.selected = selectedItem
                return
            ), ->
                $log.info 'Modal dismissed at: ' + new Date
                return

        $scope.toggleAnimation = ->
            $scope.animationsEnabled = !$scope.animationsEnabled
            return

        return
]
