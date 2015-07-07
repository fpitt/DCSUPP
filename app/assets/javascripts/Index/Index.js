/**
 * Created by Christina on 2015-06-28.
 */
angular.module('dcsupp')
    .config(function ($stateProvider) {
        $stateProvider.state('/', {
            url: '/?:goto',
            controller: 'IndexCtrl'
        });
    });
