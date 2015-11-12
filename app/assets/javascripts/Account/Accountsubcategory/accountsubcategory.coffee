# -------------------------------------------------------------------------------------------------------
# UI-Router state declaration for Subcategory Info page.
# -------------------------------------------------------------------------------------------------------
AccountSubCategory = ($stateProvider) ->
    $stateProvider.state 'account.attribute_subcategory',
        url: '/attribute_subcategory/:id'
        templateUrl: 'Account/Accountsubcategory/_account_subcategory.html'
        controller: 'AttributeSubCategoryCtrl'


angular.module('dcsupp').config(AccountSubCategory)

AccountSubCategory.$injector = ['$stateProvider']