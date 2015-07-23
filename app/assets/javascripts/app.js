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
                User.getUser.success(function(data) {
                    return !data.professor && !data.administrator;
                });
            })
            .defineRole('administrator', function (stateParams) {
                User.getUser.success(function(data) {
                    return data.administrator;
                });
            })
        .defineRole('professor', function (stateParams) {
                User.getUser.success(function(data) {
                    return data.professor;
                });
        })
        .defineRole('anonymous', function (stateParams) {
                User.getUser.success(function(data) {
                    return data == null;
                });
        });
    });