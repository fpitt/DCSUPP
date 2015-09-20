# -------------------------------------------------------------------------------------------------------
# UI-Router state declaration for Current Project page.
# -------------------------------------------------------------------------------------------------------
angular.module('dcsupp').config ($stateProvider) ->
    $stateProvider.state 'current_project',
        url: '/current_project'
        abstract: true
        templateUrl: 'CurrentProject/_current_project.html'
        controller: 'CurrentProjectCtrl'
