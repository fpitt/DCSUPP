controllerFunction = ($scope, requestService, modalService, $stateParams, $state, ProjectApplication) ->

    $scope.modalService = modalService

    $scope.application = {}

    $scope.createApplication = () ->
        payload =
            application:
                $scope.application
            project:
                $stateParams.id

        ProjectApplication.create(payload).success((data) ->
            $state.go('your_applications.application_info', {id: data.id}))

        return




angular
.module('dcsupp')
.controller('ApplyProjectCtrl', ['$scope', 'requestService', 'modalService', '$stateParams', '$state', 'ProjectApplication', controllerFunction])
