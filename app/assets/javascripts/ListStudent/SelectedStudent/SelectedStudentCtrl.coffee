controllerFunction = ($scope, requestService, $stateParams) ->
    $scope.sendParams =
        url: '/users/' + $stateParams.id + '.json'
        method: 'GET'

    $scope.items = [
        'item1'
        'item2'
        'item3'
    ]

    $scope.nameCollapsed = $scope.emailCollapsed = true
    $scope.student = {}
    $scope.payload = {}

    $scope.getStudent = ->
        requestService.service($scope.sendParams).success((data) ->
            $scope.student = data
            $scope.payload = jQuery.extend(true, {}, data))
        return

    $scope.patchStudent = ->
        patchSendParams =
            url: '/users/' + $scope.student.id + '.json'
            method: 'PATCH'
        requestService.service(patchSendParams, $scope.payload).success((data) ->
            $scope.getStudent())
        return

    $scope.getStudent();

angular
.module('dcsupp')
.controller('SelectedStudentCtrl', ['$scope', 'requestService', '$stateParams', controllerFunction])
