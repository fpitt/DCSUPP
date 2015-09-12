# ---------------------------------------------------------
# Page 1: Introduction Page
#
# This page is the introduction page of the DCSUPP project.
# The page is accessible without a login and contains the 
# information for the project. The page is 3 button navs.
# ---------------------------------------------------------


angular.module('dcsupp').controller 'IntroCtrl', [
    '$scope'
    '$state'
    ($scope, $state) ->
        $scope.page = 'intro page'
        $state.go 'intro.1'
        return
]
