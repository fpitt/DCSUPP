# -------------------------------------------------------------------------------------------------------
# UI-Router state declaration for Subcategory Info page.
# -------------------------------------------------------------------------------------------------------
PersonalIntroduction =  ($stateProvider) ->
    $stateProvider.state 'account.personal_introduction',
        url: '/personal_introduction'
        templateUrl: 'Account/PersonalIntroduction/_personal_information.html'
        controller: 'PersonalIntroductionCtrl'

angular.module('dcsupp').config(PersonalIntroduction)

PersonalIntroduction.$injector = ['$stateProvider'] 