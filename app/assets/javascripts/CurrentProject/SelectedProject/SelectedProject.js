angular.module('dcsupp')
    .config(function ($stateProvider) {
        $stateProvider.state('current_project.selected_project', {
            url: '/selected_project?:id',
            templateUrl: 'CurrentProject/SelectedProject/_selected_project.html',
            controller: 'SelectedProjectCtrl'
        });
    });
