angular.module('dcsupp').controller 'ListStudentCtrl', [
    '$scope'
    '$modal'
    'modalService'
    'requestService'
    ($scope, $modal, modalService, requestService) ->
        $scope.modalService = modalService

        $scope.items = [
            'item1'
            'item2'
            'item3'
        ]


        $scope.sendParams =
            url: '/students.json'
            method: "GET"

        successFunction = (data) ->
            $scope.students = data


        $scope.loadStudents = ->

            requestService.service($scope.sendParams).success(successFunction)


        $scope.loadStudents()
]
