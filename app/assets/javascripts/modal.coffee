ServiceFunction = ()->

    modal.open = (templateUrl, controller, data) ->
        modalInstance = $modal.open(
            animation: true
            templateUrl: 'CreateProject/CreateProjectSettings/create_project_settings.html'
            controller: 'CreateProjectSettingsCtrl'
            size: size
            resolve: items: ->
                data
        )
        modalInstance.result.then ((selectedItem) ->
            selected = selectedItem
            return
        ), ->
        return

    return modal

angular
.module('dcsupp')
.service('modalService', ServiceFunction)
