angular.module('dcsupp', ['ui.bootstrap', 'ui.router', 'templates']).config([
    '$stateProvider', '$urlRouterProvider', '$locationProvider',
    function ($stateProvider, $urlRouterProvider, $locationProvider) {

        $urlRouterProvider.otherwise('intro');
        $locationProvider.html5Mode(true).hashPrefix('!');
    }
]);

angular.module('dcsupp').run(function($rootScope, $state) {
    $rootScope.$on('$routeChangeStart', function(next, current){
        var loggedIn = true;
        if (!loggedIn){
            $state.go('auth');
        }
    });
});
