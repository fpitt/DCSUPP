PopupCtrl = ($scope, $modalInstance) ->
	$scope.ok = ->
		$modalInstance.close()
	return

angular.module('dcsupp').controller('InfoCtrl', 
	['$scope', '$modalInstance', PopupCtrl])