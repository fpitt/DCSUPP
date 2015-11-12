# -------------------------------------------------------------------------------------------------------
# UI-Router state declaration for Subcategory Info page.
# -------------------------------------------------------------------------------------------------------
angular.module('dcsupp').config ['$stateProvider', ($stateProvider) ->
    $stateProvider.state 'account.attribute_subcategory',
        url: '/attribute_subcategory/:id'
        templateUrl: 'Account/Accountsubcategory/_account_subcategory.html'
        controller: 'AttributeSubCategoryCtrl' 
]