controllerFunction = ($scope, requestService, modalService, $stateParams) ->

    $scope.modalService = modalService

    $scope.sendParams =
        method: 'GET'
        url: '/project_applications/' + $stateParams.id + '.json'

    $scope.items = [
        'item1'
        'item2'
        'item3'
    ]

    $scope.getProjectApplications = () ->
        requestService.service($scope.sendParams).success((data) ->
            $scope.application = data)


    $scope.getProjectApplications()

angular
.module('dcsupp')
.controller('YourProjectsCtrl', ['$scope', 'requestService', 'modalService', '$stateParams', controllerFunction])
