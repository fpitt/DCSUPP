# ---------------------------------------------------------
# Intro page state + child state declaration.
# ---------------------------------------------------------
angular.module('dcsupp').config ($stateProvider) ->
    $stateProvider.state('intro',
        url: '/intro'
        templateUrl: 'Intro/_intro.html'
        controller: 'IntroCtrl')