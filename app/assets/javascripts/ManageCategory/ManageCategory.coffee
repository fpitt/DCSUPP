angular.module('dcsupp').config(['$stateProvider', ($stateProvider) ->
    $stateProvider.state 'manage_category',
        url: '/manage_category'
        templateUrl: 'ManageCategory/_manage_category.html'
        controller: 'ManageCategoryCtrl'
        access:
            requiredPermissions: ['administrator', 'professor']
])