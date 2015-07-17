angular.module('dcsupp').controller 'StudentAccountCtrl', [
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
]