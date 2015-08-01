angular.module('dcsupp', ['ui.bootstrap', 'ui.router', 'templates', 'permission']).config([
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

        User.getUser().success(function (data) {
            if (!data.professor && !data.administrator) {
                User.role = 'student';
            } else if (data.professor && !data.administrator) {
                User.role = 'professor';
            } else if (data.administrator) {
                User.role = 'administrator';
            } else {
                User.role = 'anonymous';
            };
        });

        Permission
            .defineRole('student', function (stateParams) {
                var deferred = $q.defer();

                User.getAccessLevel().then(function (data) {
                    if (!data.data.professor && !data.data.administrator) {
                        deferred.resolve(true);
                    } else {
                        deferred.reject(false);
                    }
                }, function () {
                    // Error with request
                    deferred.reject(false);
                });

                return deferred.promise;
            })
            .defineRole('administrator', function (stateParams) {
                var deferred = $q.defer();

                User.getAccessLevel().then(function (data) {
                    if (data.data.administrator) {
                        deferred.resolve(true);
                    } else {
                        deferred.reject(false);
                    }
                }, function () {
                    // Error with request
                    deferred.reject(false);
                });

                return deferred.promise;
            })
            .defineRole('professor', function (stateParams) {
                var deferred = $q.defer();

                User.getAccessLevel().then(function (data) {
                    if (data.data.professor && !data.data.administrator) {
                        deferred.resolve(true);
                    } else {
                        deferred.reject(false);
                    }
                }, function () {
                    // Error with request
                    deferred.reject(false);
                });

                return deferred.promise;
            })
            .defineRole('anonymous', function (stateParams) {
                var deferred = $q.defer();

                User.getAccessLevel().then(function (data) {
                    if (!data.data.id) {
                        deferred.resolve(true);
                    } else {
                        deferred.reject(false);
                    }
                }, function () {
                    // Error with request
                    deferred.reject(false);
                });

                return deferred.promise;
            });
    });
