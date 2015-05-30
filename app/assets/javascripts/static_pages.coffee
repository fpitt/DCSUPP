controllerFunction = ($scope, $http) ->
	$scope.pagenumber = 1
	$scope.return_html = ''

	$scope.flip = (direction) ->
    	request = {
      		pageNumber: $scope.pagenumber,
      		direction: direction
    	}

    	$.ajax
    		method: 'POST',
        	url: '/flip_project_direction.html',
        	data: request,
        	headers: {
        		'X-CSRF-Token': $('meta[name="csrf-token"]').attr('content')
			}
			success: (data) ->
				$scope.return_html = data
				$scope.$apply()
			error: (data) ->
				console.log("error")


filterFunction = ($sce)->
    return (val)->
        return $sce.trustAsHtml(val)
        

angular
	.module("projectPage", [])
	.controller("pjtCtrl", controllerFunction)
	.filter('html', filterFunction)
