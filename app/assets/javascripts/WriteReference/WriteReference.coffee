angular.module('dcsupp').config ($stateProvider) ->
    $stateProvider.state 'write_reference',
        url: '/write_reference/:id'
        templateUrl: 'WriteReference/_write_reference.html'
        controller: 'WriteReferenceCtrl'
        data:
            permissions:
                only: ['professor', 'administrator']

