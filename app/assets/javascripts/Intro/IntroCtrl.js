angular.module('dcsupp').controller('IntroCtrl', ['$scope', '$state', function ($scope, $state) {
    $scope.page = "intro page";

    $state.go('intro.1')
}]);
