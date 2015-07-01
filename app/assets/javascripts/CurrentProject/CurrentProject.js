/**
 * Created by Christina on 2015-06-28.
 */
angular.module('dcsupp')
    .config(function ($stateProvider) {
        $stateProvider.state('current_project', {
            url: '/current_project',
            templateUrl: 'CurrentProject/_current_project.html',
            controller: 'CurrentProjectCtrl'
        });
    });
