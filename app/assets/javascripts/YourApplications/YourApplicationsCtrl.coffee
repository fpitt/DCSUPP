controllerFunction = ($scope, requestService, modalService, $stateParams) ->

    $scope.modalService = modalService

    $scope.sendParams =
        method: 'POST'
        url: '/get_applications_of_user.json'

    $scope.items = [
        'item1'
        'item2'
        'item3'
    ]

    $scope.getProjectApplications = () ->
        requestService.service($scope.sendParams).success((data) ->
            $scope.applications = data)


    $scope.getProjectApplications()

angular
.module('dcsupp')
.controller('YourApplicationsCtrl', ['$scope', 'requestService', 'modalService', '$stateParams', controllerFunction])
