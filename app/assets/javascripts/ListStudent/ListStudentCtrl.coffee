angular.module('dcsupp').controller 'ListStudentCtrl', [
    '$scope'
    '$modal'
    'modalService'
    ($scope, $modal, modalService) ->
        $scope.modalService = modalService

        $scope.items = [
            'item1'
            'item2'
            'item3'
        ]


        $scope.sendParams =
            url: '/list_student.json'
            method: "GET"

        successFunction = (data) ->
            $scope.students = data


        $scope.loadStudents = ->

            requestService.service($scope.sendParams).success(successFunction)


        return
]
