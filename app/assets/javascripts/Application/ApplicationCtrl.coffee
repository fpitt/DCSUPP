# Controller for application.html.slim in views/layouts
# used to give the page access to modalService
angular
	.module('dcsupp')
	.controller 'ApplicationCtrl', ['$scope','modalService', 
		($scope, modalService) ->
    		$scope.modalService = modalService
    ]
