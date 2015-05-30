controllerFunction = ($scope, $http) ->
	$scope.pagenumber = 1

	$scope.subcategories = (category_id)->
    	request = {
      		category_id: category_id
    	}

    	$.ajax
        	url: '/get_project.html',
        	method: "POST",
        	headers: {
        		'X-CSRF-Token': $('meta[name="csrf-token"]').attr('content')
			},
        	data: request
        	success: (data) ->
				$("#project_information").html(data)


  	$scope.flip = (direction) ->
    	request = {
      		pageNumber: pageNumber,
      		direction: direction
    	}

    	$.ajax
        	url: '/flip_project_direction.html',
        	method: "POST",
        	headers: {
        		'X-CSRF-Token': $('meta[name="csrf-token"]').attr('content')
			},
			data: request
			success: (data) ->
            	$("#itemPosts3").html(data);
            	if (direction > 0)
            		$scope.pagenumber += 1
            	else if (direction < 0 && $scope.pagenumber > 1)
            		$scope.pagenumber -= 1

            	$scope.$apply
        

angular
	.module("projectPage", [])
	.controller("pjtCtrl", controllerFunction)

