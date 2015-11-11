# -------------------------------------------------------------------------------------------------------
# Page: Your Applications Page
#
# Summary:
# This is the your applications page for DCSUPP
# for students to view all of the applications that they have submitted.
# -------------------------------------------------------------------------------------------------------
controllerFunction = ($scope, ProjectApplication) ->

    #   current page number
    $scope.pagenumber = 1

    #   get all project applications that this user has submitted
    #    $scope.getProjectApplications = () ->
    #        ProjectApplication.getByCurrentUser().success((data) ->
    #            $scope.applications = data
    #        )

    #   flip page
    $scope.flip = (direction) ->
        ProjectApplication.flipApplicationsOfUser(direction: direction, pagenumber: $scope.pagenumber).success((data) ->
            if (data)
                $scope.applications = data
                if direction > 0
                    $scope.pagenumber += 1
                else if direction < 0
                    $scope.pagenumber -= 1
                else
                    $scope.pagenumber = 1
        )

    #   run this code when page loads
    $scope.flip(0)

angular
.module('dcsupp')
.controller('YourApplicationsCtrl', ['$scope', 'ProjectApplication', 
    'modalService', controllerFunction])

controllerFunction.$injector = ['$scope', 'ProjectApplication', 'modalService']