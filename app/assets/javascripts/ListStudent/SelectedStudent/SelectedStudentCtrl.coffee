controllerFunction = ($scope, requestService, $stateParams, Rating) ->
    $scope.sendParams =
        url: '/users/' + $stateParams.id + '.json'
        method: 'GET'

    $scope.items = [
        'item1'
        'item2'
        'item3'
    ]

    $scope.nameCollapsed = $scope.emailCollapsed = true
    $scope.user = {}
    $scope.payload = {}

    $scope.getUser = ->
        requestService.service($scope.sendParams).success((data) ->
            $scope.user = data
            $scope.payload = jQuery.extend(true, {}, data))
        return

    $scope.patchUser = ->
        patchSendParams =
            url: '/users/' + $scope.user.id + '.json'
            method: 'PATCH'
        requestService.service(patchSendParams, $scope.payload).success((data) ->
            $scope.getStudent())
        return

    $scope.getRatings = () ->
        payload =
            student : $stateParams.id
        Rating.getStudentRatings(payload).success((data) ->
            $scope.ratings  = data
        )

#    $scope.addRating = () ->
#        payload =
#            student : $stateParams.id
#            rating : $scope.rating
#        Rating.create(payload).success((dat) ->
#            $scope.getRatings
#        )

    $scope.getUser();
    $scope.getRatings();


angular
.module('dcsupp')
.controller('SelectedStudentCtrl', ['$scope', 'requestService', '$stateParams', 'Rating', controllerFunction])
