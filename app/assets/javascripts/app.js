angular.module('dcsupp', ['ui.bootstrap', 'ui.router', 'templates']).config([
    '$stateProvider', '$urlRouterProvider', '$locationProvider',
    function ($stateProvider, $urlRouterProvider, $locationProvider) {

        $urlRouterProvider.otherwise('intro');
        $locationProvider.html5Mode(true).hashPrefix('!');
    }
]);



