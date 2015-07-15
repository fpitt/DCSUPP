angular.module('dcsupp').config ($stateProvider) ->
    $stateProvider.state '/',
        url: '/?:goto'
        controller: 'IndexCtrl'
