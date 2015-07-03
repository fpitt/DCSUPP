angular.module('dcsupp', ['ui.router', 'templates']).config([
    '$stateProvider', '$urlRouterProvider', '$locationProvider',
    function ($stateProvider, $urlRouterProvider, $locationProvider) {
        $stateProvider.state('/', {
            url: '/?:goto',
            controller: 'IndexCtrl'
        });

        $urlRouterProvider.otherwise('intro');
        $locationProvider.html5Mode(true).hashPrefix('!');
    }
]);



