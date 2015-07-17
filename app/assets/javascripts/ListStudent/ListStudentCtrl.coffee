angular.module('dcsupp').controller 'ListStudentCtrl', [
    '$scope'
    '$modal'
    'modalService'
    ($scope, $modal, modalService) ->
        $scope.modalService = modalService

        $scope.items = [
            'item1'
            'item2'
            'item3'
        ]

        $scope.toggleAnimation = ->
            $scope.animationsEnabled = !$scope.animationsEnabled
            return

        return
]
