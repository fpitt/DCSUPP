# -------------------------------------------------------------------------------------------------------
# UI-Router state declaration for Subcategory Info page.
# -------------------------------------------------------------------------------------------------------
angular.module('dcsupp').config(['$stateProvider', ($stateProvider) ->
    $stateProvider.state 'manage_category.subcategory_info',
        url: '/subcategory_info/:id'
        templateUrl: 'ManageCategory/SubcategoryInfo/_subcategory_info.html'
        controller: 'SubcategoryInfoCtrl'
])
