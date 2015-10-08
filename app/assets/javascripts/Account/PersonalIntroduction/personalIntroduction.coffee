# -------------------------------------------------------------------------------------------------------
# UI-Router state declaration for Subcategory Info page.
# -------------------------------------------------------------------------------------------------------
angular.module('dcsupp').config ($stateProvider) ->
    $stateProvider.state 'account.personal_introduction',
        url: '/personal_introduction/:id'
        templateUrl: 'Account/PersonalIntroduction/_personal_information.html'
        controller: 'PersonalIntroductionCtrl'
