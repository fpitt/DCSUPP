angular.module('dcsupp').config ($stateProvider) ->
    $stateProvider.state 'current_project.selected_project',
        url: '/:id'
        templateUrl: 'CurrentProject/SelectedProject/_selected_project.html'
        controller: 'SelectedProjectCtrl'
        data:
            permissions:
                except: ['anonymous']