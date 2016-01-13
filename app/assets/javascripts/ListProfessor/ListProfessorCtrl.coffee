angular
.module('dcsupp')
.controller 'ListProfessorCtrl', ['$scope', '$modal', 'User', 
    'requestService', ($scope, $modal, User, requestService) ->
        # --- Page Variables ---

        $scope.direction = 0
        $scope.professors = null
        $scope.pagenumber = 1

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
                    $scope.professors = data.data
                    if $scope.direction > 0
                        $scope.pagenumber += 1
                    else if $scope.direction < 0
                        $scope.pagenumber -= 1
                    else
                        $scope.pagenumber = 1
            )


        # --- JQuery Initialization Code ---
        $scope.flip(0)
    ]