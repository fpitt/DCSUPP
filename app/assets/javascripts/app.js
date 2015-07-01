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
                templateUrl: 'CurrentProject/_current_project.html.slim',
                controller: 'CurrentProjectCtrl'
            })
            .state('create_project', {
                url: '/create_project',
                templateUrl: 'CreateProject/_create_project.html.slim',
                controller: 'CreateProjectCtrl'
            })
            .state('manage_category', {
                url: '/manage_category',
                templateUrl: 'ManageCategory/_manage_category.html.slim',
                controller: 'ManageCategoryCtrl'
            })
            .state('list_student', {
                url: '/list_student',
                templateUrl: 'ListStudent/_list_student.html.slim',
                controller: 'ListStudentCtrl'
            });

        $urlRouterProvider.otherwise('intro');
        $locationProvider.html5Mode(true);
    }
]);

angular.module('dcsupp').controller('IntroCtrl', ['$scope', '$state', function ($scope, $state) {
    $scope.page = "intro page";

}]);

angular.module('dcsupp').controller('StudentAccountCtrl', ['$scope', function ($scope) {
    $scope.page = "student account";

    //$scope.getCategory = function() {
    //    Restangular.all('/flip_student_settings').getList().then(function(serverJson) {
    //        $scope.category = serverJson.plain();
    //    });
    //};
    //
    //$scope.getSubcategories = function(postId) {
    //    Restangular.all().getList().then(function(serverJson) {
    //        $scope.category = serverJson.plain();
    //    });
    //};

    /////////
    //$scope.getCategory();
}]);

angular.module('dcsupp').controller('CurrentProjectCtrl', ['$scope', function ($scope) {
    console.log("d");
    $scope.page = "current project";
}]);

angular.module('dcsupp').controller('CreateProjectCtrl', ['$scope', function ($scope) {
    $scope.page = "create project";
}]);

angular.module('dcsupp').controller('ManageCategoryCtrl', ['$scope', function ($scope) {
    $scope.page = "manage category";

    //$scope.getCategory = function() {
    //    Restangular.all('/flip_student_settings').getList().then(function(serverJson) {
    //        $scope.category = serverJson.plain();
    //    });
    //};
    //
    //$scope.getSubcategories = function(postId) {
    //    Restangular.all().getList().then(function(serverJson) {
    //        $scope.category = serverJson.plain();
    //    });
    //};
    ///////////////
    //$scope.getCategory();
}]);

angular.module('dcsupp').controller('ListStudentCtrl', ['$scope', function ($scope) {
    $scope.page = "list student";
}]);