/**
 * Created by Christina on 2015-06-28.
 */
angular.module('dcsupp')
    .config(function ($stateProvider) {
        $stateProvider.
            state('intro', {
                url: '/intro',
                templateUrl: 'Intro/_intro.html',
                controller: 'IntroCtrl'
            });
    });