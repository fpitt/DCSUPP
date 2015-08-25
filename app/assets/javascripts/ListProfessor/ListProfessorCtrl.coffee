controllerFunction = ($scope, $modal, modalService, User, requestService) ->

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
        params = 
            method: 'POST'
            url: '/flip_professor_direction.json'
        payload =
            direction: pushDirection
            pagenumber: $scope.pagenumber
        
        requestService.service(params, payload).then((data) ->
            if (data)
                $scope.professors = data
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
.controller('ListProfessorCtrl', ['$scope', '$modal', 'modalService', 'User', 'requestService', controllerFunction])
