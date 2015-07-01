angular.module('dcsupp', ['ui.router', 'templates']).config([
    '$stateProvider', '$urlRouterProvider', '$locationProvider',
    function ($stateProvider, $urlRouterProvider, $locationProvider) {
        $stateProvider.
            state('intro', {
            url: '/intro',
            templateUrl: 'Intro/_intro.html',
            controller: 'IntroCtrl'
            })
            .state('student_account', {
                url: '/student_account',
                templateUrl: 'StudentAccount/_student_account.html',
                controller: 'StudentAccountCtrl'
            })
            .state('current_project', {
                url: '/current_project',
                templateUrl: 'CurrentProject/_current_project.html',
                controller: 'CurrentProjectCtrl'
            })
            .state('create_project', {
                url: '/create_project',
                templateUrl: 'CreateProject/_create_project.html',
                controller: 'CreateProjectCtrl'
            })
            .state('manage_category', {
                url: '/manage_category',
                templateUrl: 'ManageCategory/_manage_category.html',
                controller: 'ManageCategoryCtrl'
            })
            .state('list_student', {
                url: '/list_student',
                templateUrl: 'ListStudent/_list_student.html',
                controller: 'ListStudentCtrl'
            });

        $urlRouterProvider.otherwise('intro');
        $locationProvider.html5Mode(true);
    }
]);





