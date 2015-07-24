angular.module('dcsupp').controller 'AccountCtrl', [
    '$scope'
    '$modal'
    'modalService'
    'requestService'
    'User',
    '$state'
    ($scope, $modal, modalService, requestService, User, $state) ->
        $scope.modalService = modalService
        $scope.items = [
            'item1'
            'item2'
            'item3'
        ]

        $scope.nameCollapsed = $scope.emailCollapsed = true
        $scope.user = {}
        $scope.payload = {}

        $scope.getUser = ->
            User.getUser().success((data) ->
                $scope.user = data
                $scope.payload = jQuery.extend(true, {}, data))
            return

        $scope.patchUser = ->
            patchSendParams =
                url: '/users/' + $scope.user.id + '.json'
                method: 'PATCH'
            requestService.service(patchSendParams, $scope.payload).success((data) ->
                $scope.getUser())
            return

        $scope.updateProject = ->
            $state.go('update_project', {id: 1})

        $scope.getUser();
]