# Controller for application.html.slim in views/layouts
# used to give the page access to modalService
controllerFunction = ($scope, modalService) ->
    $scope.modalService = modalService

angular
	.module('dcsupp')
	.controller('ApplicationCtrl', ['$scope','modalService', controllerFunction])

ApplicationCtrl.$inject = ['$scope','modalService']
