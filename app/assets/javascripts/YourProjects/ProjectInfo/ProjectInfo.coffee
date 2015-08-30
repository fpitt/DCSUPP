angular.module('dcsupp').config ($stateProvider) ->
    $stateProvider.state 'your_projects.project_info',
        url: '/project_info/:id'
        templateUrl: 'CurrentProject/SelectedProject/_selected_project.html'
        controller: 'SelectedProjectCtrl'
        data:
            permissions:
                only: ['administrator', 'professor']