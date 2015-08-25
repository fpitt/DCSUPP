ListStudentFunction = ($scope, $modal, modalService, requestService) ->
        
    $scope.modalService = modalService
    
    # --- Page Variables --- 

    $scope.direction = 0
    $scope.students = null
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
        sendParams =
            method: 'POST'
            url: '/students.json'
        $scope.direction = pushDirection

        requestService.service(sendParams, payload).success(flipSuccess)

    flipSuccess = (data) ->
        if (data)
            $scope.students = data
            console.log($scope.students)
            if $scope.direction > 0
                $scope.pagenumber += 1
            else if $scope.direction < 0
                $scope.pagenumber -= 1
            else
                $scope.pagenumber = 1

    # --- JQuery Initialization Code --- 
    $('[data-toggle="tooltip"]').tooltip()
    $scope.flip(0)

angular
    .module('dcsupp')
    .controller('ListStudentCtrl', ['$scope', '$modal', 'modalService', 'requestService', ListStudentFunction])
    