angular.module('dcsupp', ['ui.bootstrap', 'ui.router', 'templates', 'permission']).config([
    '$stateProvider', '$urlRouterProvider', '$locationProvider',
    function ($stateProvider, $urlRouterProvider, $locationProvider) {
        $urlRouterProvider.otherwise('intro');
        $locationProvider.html5Mode(true).hashPrefix('!');
        //
        //User.getUser().success(function () {
        //   User.user = data;
        //});
        //
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
    .run(function (Permission, User) {

        User.getUser().success(function(data) {
            Permission
                .defineRole('student', function (stateParams) {
                    return !data.professor && !data.administrator;
                })
                .defineRole('administrator', function (stateParams) {
                    return data.administrator;
                })
                .defineRole('professor', function (stateParams) {
                    return data.professor;
                })
                .defineRole('anonymous', function (stateParams) {
                    return data == null;
                });
        });
    });