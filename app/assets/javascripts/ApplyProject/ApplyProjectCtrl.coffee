controllerFunction = ($scope, requestService, modalService, $stateParams, User) ->

    $scope.modalService = modalService

    $scope.application = {}

    $scope.createApplication = () ->
        User.getUser().success((data) ->
            $scope.application.student = data.id
            $scope.application.project = $stateParams.id

            patchSendParams =
                url: '/project_applications/' + $stateParams.id + '.json'
                method: 'POST'
            requestService.service(patchSendParams, $scope.application).success((data) ->
                $state.go('your_applications.selected_application', {id: data.id}))
            return
        )

angular
.module('dcsupp')
.controller('ApplyProjectCtrl', ['$scope', 'requestService', 'modalService', '$stateParams', 'User', controllerFunction])
