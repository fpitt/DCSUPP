angular.module('dcsupp', ['ui.bootstrap', 'ui.router', 'templates', 'ngCookies', 'permission']).config([
    '$stateProvider', '$urlRouterProvider', '$locationProvider',
    function ($stateProvider, $urlRouterProvider, $locationProvider) {
        $urlRouterProvider.otherwise('intro');
        $locationProvider.html5Mode(true).hashPrefix('!');
    }
]);

//angular.module('dcsupp').run(function($rootScope, $state) {
//    $rootScope.$on('$routeChangeStart', function(next, current){
//        var loggedIn = true;
//        if (!loggedIn){
//            $state.go('auth');
//        }
//    });
//});

angular.module('dcsupp')
    .run(function (Permission, User, $q) {
        Permission
            .defineRole('student', function (stateParams) {
                if (User.getAccessLevel() == 'student') {
                    return true;
                } else {
                    return false;
                };
            })
            .defineRole('administrator', function (stateParams) {
                if (User.getAccessLevel() == 'administrator') {
                    return true;
                } else {
                    return false;
                };
            })
        .defineRole('professor', function (stateParams) {
                if (User.getAccessLevel() == 'professor') {
                    return true;
                } else {
                    return false;
                };
        })
        .defineRole('anonymous', function (stateParams) {
                if (User.getAccessLevel() == 'anonymous') {
                    return true;
                } else {
                    return false;
                };
        });
    });