# -------------------------------------------------------------------------------------------------------
# Page: Your Applications Page
#
# Summary:
# This is the your applications page for DCSUPP
# for students to view all of the applications that they have submitted.
# -------------------------------------------------------------------------------------------------------
controllerFunction = ($scope, ProjectApplication, modalService) ->
    #   pop-up service for page settings and info
    $scope.modalService = modalService

    #   get all project applications that this user has submitted
    $scope.getProjectApplications = () ->
        ProjectApplication.getByCurrentUser().success((data) ->
            $scope.applications = data
        )

    #   run this code when page loads
    $scope.getProjectApplications()

angular
.module('dcsupp')
.controller('YourApplicationsCtrl', ['$scope', 'ProjectApplication', 'modalService', controllerFunction])
