angular.module('dcsupp')
    .config(function ($stateProvider) {
        $stateProvider.state('manage_category', {
            url: '/manage_category',
            templateUrl: 'ManageCategory/_manage_category.html',
            controller: 'ManageCategoryCtrl'
        });
    });
