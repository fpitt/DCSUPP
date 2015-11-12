# ---------------------------------------------------------
# Service Module: Modal Service
#
# This module is used by the frontend buttons to open
# popup diaglogues. 
# Injected as a service into controllers
# ---------------------------------------------------------
angular
    .module('dcsupp')
    .service 'modalService', ($modal)->
        
        modal = {}

        #function to open intended URL as a popup
        modal.open = (templateUrl, controller, data) ->
            
            modalInstance = $modal.open(
                animation: false
                templateUrl: templateUrl
                size: 'lg'
                controller: controller
                resolve: items: ->
                    data
            )
            modalInstance.result.then ((selectedItem) ->
                selected = selectedItem
                return
            ), ->
            return

        return modal