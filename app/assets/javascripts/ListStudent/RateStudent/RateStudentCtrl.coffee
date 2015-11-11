# NOT USED AT THE MOMENT

controllerFunction = ($scope, $state, modalService, Rating, $stateParams) ->

    $scope.rating = {}
    $scope.project_rating = false

    $scope.createRating = () ->
        payload =
            rating : $scope.rating.rating
            comment : $scope.rating.comment
            student : $stateParams.id
        Rating.create(payload).success((data) ->
            $state.go("list_student.selected_student", {id: $stateParams.id})
        )


angular
.module('dcsupp')
.controller('RateStudentCtrl', ['$scope', '$state', 'modalService', 'Rating', 
    '$stateParams', controllerFunction])
    
RateStudentCtrl.$injector = ['$scope', '$state', 'modalService', 'Rating', 
    '$stateParams']