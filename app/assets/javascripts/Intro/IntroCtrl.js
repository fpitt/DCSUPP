angular.module('dcsupp').controller('IntroCtrl', ['$scope', '$state', function ($scope, $state) {
    $scope.page = "intro page";

    console.log($.cache)
    $state.go('intro.1')
}]);
