controllerFunction = ($scope, $modal, modalService, User) ->

    $scope.modalService = modalService

    # --- Page Variables ---

    $scope.direction = 0
    $scope.professors = null
    $scope.pagenumber = 1

    $scope.items = [
        'item1'
        'item2'
        'item3'
    ]

    # --- Page Navigation ---

    $scope.flip = (pushDirection) ->
        payload =
            direction: pushDirection
            pagenumber: $scope.pagenumber
        User.flipProfessors(payload).success((data) ->
            if (data)
                $scope.professors = data
                console.log($scope.students)
                if $scope.direction > 0
                    $scope.pagenumber += 1
                else if $scope.direction < 0
                    $scope.pagenumber -= 1
                else
                    $scope.pagenumber = 1
        )


    # --- JQuery Initialization Code ---
    $scope.flip(0)

angular
.module('dcsupp')
.controller('ListProfessorCtrl', ['$scope', '$modal', 'modalService', 'User', controllerFunction])
