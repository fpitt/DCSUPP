angular.module('dcsupp').controller 'UpdateProjectCtrl', [
    '$scope'
    '$modal'
    'modalService'
    'requestService'
    'User',
    '$stateParams',
    ($scope, $modal, modalService, requestService, User, $stateParams) ->
        $scope.modalService = modalService
        $scope.items = [
            'item1'
            'item2'
            'item3'
        ]

        $scope.project = {}

        $scope.getProject = ->
            patchSendParams =
                url: '/projects/' + $stateParams.id + '.json'
                method: 'GET'
            requestService.service(patchSendParams).success((data) ->
                $scope.project = data)
            return

        $scope.patchProject = ->
            patchSendParams =
                url: '/projects/' + $stateParams.id + '.json'
                method: 'PATCH'
            requestService.service(patchSendParams, $scope.project).success((data) ->
                $scope.getProject())
            return


        $scope.getProject();
]