# ---------------------------------------------------------
# Page 1: Introduction Page
#
# This page is the introduction page of the DCSUPP project.
# The page is accessible without a login and contains the 
# information for the project. The page is 3 button navs.
# --------------------------------------------------------
IntroductionCtrl = ($scope, $state) ->


angular.module('dcsupp').controller('IntroCtrl', 
	['$scope', '$state', IntroductionCtrl])
