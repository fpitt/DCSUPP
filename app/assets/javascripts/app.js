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
                //var deferred = $q.defer();
                //
                //User.getAccessLevel().then(function (data) {
                //    if (data.accessLevel === 'student') {
                //        deferred.resolve();
                //    } else {
                //        deferred.reject();
                //    }
                //}, function () {
                //    deferred.reject();
                //});
                //
                //return deferred.promise;
                return false;

            })
            .defineRole('administrator', function (stateParams) {
                //var deferred = $q.defer();
                //
                //User.getAccessLevel().then(function (data) {
                //    if (data.accessLevel === 'administrator') {
                //        deferred.resolve();
                //    } else {
                //        deferred.reject();
                //    }
                //}, function () {
                //    deferred.reject();
                //});
                //
                //return deferred.promise;
                return false;
            })
        .defineRole('professor', function (stateParams) {
            //var deferred = $q.defer();
            //
            //User.getAccessLevel().then(function (data) {
            //    if (data.accessLevel === 'professor') {
            //        deferred.resolve();
            //    } else {
            //        deferred.reject();
            //    }
            //}, function () {
            //    deferred.reject();
            //});
            //
            //return deferred.promise;
                return false;
        })
        .defineRole('anonymous', function (stateParams) {
            //var deferred = $q.defer();
            //
            //User.getAccessLevel().then(function (data) {
            //    if (data.accessLevel === 'anonymous') {
            //        deferred.resolve();
            //    } else {
            //        deferred.reject();
            //    }
            //}, function () {
            //    deferred.reject();
            //});
            //
            //return deferred.promise;
                return true;
        });
    });