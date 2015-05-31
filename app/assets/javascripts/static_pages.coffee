controllerFunction = ($scope, $http) ->
	$scope.pagenumber = 1
	$scope.return_html = ''

	$scope.flip = (direction) ->
    	request = 
            method: 'POST',
            url: '/flip_project_direction.html',
            headers: { 'X-CSRF-Token': $('meta[name="csrf-token"]').attr('content') },
            data: { pageNumber: $scope.pagenumber, direction: direction }

        $http(request).success($scope.flipSuccess)


    $scope.flipSuccess = (data) ->
        console.log(data)
        $scope.return_html = data
        $scope.$apply()
        

filterFunction = ($sce)->
    return (val)->
        return $sce.trustAsHtml(val)


angular
	.module("projectPage", [])
	.controller("pjtCtrl", controllerFunction)
	.filter('html', filterFunction)


bootstrapAngular = ->
  $('[ng-app]').each ->
    module = $(this).attr('ng-app')
    angular.bootstrap(this, [module])

$(document).on('page:load', bootstrapAngular)