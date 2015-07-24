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
    .run(function (Permission, User) {

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

            Permission
                .defineRole('student', function (stateParams) {
                    return User.role == 'student';
                })
                .defineRole('administrator', function (stateParams) {
                    return User.role == 'administrator';
                })
                .defineRole('professor', function (stateParams) {
                    return User.role == 'professor';
                })
                .defineRole('anonymous', function (stateParams) {
                    return User.role == 'anonymous';
                });

        });

    });

//angular.module('dcsupp').run(function (User, Permission) {
//
//    Permission
//        .defineRole('student', function (stateParams) {
//            return User.role == 'student';
//        })
//        .defineRole('administrator', function (stateParams) {
//            return User.role == 'administrator';
//        })
//        .defineRole('professor', function (stateParams) {
//            return User.role == 'professor';
//        })
//        .defineRole('anonymous', function (stateParams) {
//            return User.role == 'anonymous';
//        });
//});
