# -------------------------------------------------------------------------------------------------------
# UI-Router state declaration for Apply Project page.
# -------------------------------------------------------------------------------------------------------
angular.module('dcsupp').config ($stateProvider) ->
    $stateProvider.state 'current_project.apply_project',
        url: '/apply_project/:id'
        templateUrl: 'CurrentProject/ApplyProject/_apply_project.html'
        controller: 'ApplyProjectCtrl'
        data:
            permissions:
                only: ['student', 'administrator']