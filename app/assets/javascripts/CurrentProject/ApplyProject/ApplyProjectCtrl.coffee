controllerFunction = ($scope, requestService, modalService, $stateParams, $state) ->

    $scope.modalService = modalService

    $scope.application = {}

    $scope.createApplication = () ->

        $scope.sendParams =
            url: '/project_applications.json'
            method: 'POST'

        $scope.payload =
            application:
                $scope.application
            project:
                $stateParams.id

        requestService.service($scope.sendParams, $scope.payload).success((data) ->
            )
        return



angular
.module('dcsupp')
.controller('ApplyProjectCtrl', ['$scope', 'requestService', 'modalService', '$stateParams', '$state', controllerFunction])
