angular.module('dcsupp').controller 'UpdateProjectCtrl', [
    '$scope'
    '$modal'
    'modalService'
    'requestService'
    'User',
    '$stateParams',
    '$state'
    ($scope, $modal, modalService, requestService, User, $stateParams, $state) ->
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
                $state.go('your_projects.project_info', {id: $stateParams.id}))
#                $scope.getProject()
            return


        $scope.getProject();
]