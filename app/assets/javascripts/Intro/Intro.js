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
            }).
            state('intro.1', {
                url: '/1',
                templateUrl: 'Intro/_1.html'
            }).
            state('intro.2', {
                url: '/2',
                templateUrl: 'Intro/_2.html'
            }).
            state('intro.3', {
                url: '/3',
                templateUrl: 'Intro/_3.html'
            }).
            state('intro.4', {
                url: '/4',
                templateUrl: 'Intro/_4.html'
            });
    });