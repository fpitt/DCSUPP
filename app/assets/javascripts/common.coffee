filterFunction = ($sce)->
    return (val)->
        return $sce.trustAsHtml(val)


angularFunction = ->
	return initiate = ->
  		$('[ng-app]').each ->
    		module = $(this).attr('ng-app')
    		angular.bootstrap(this, [module])


angular
  .module("sharedCommon", [])
  .filter('html', filterFunction)
  .factory('bootstrapAngular', angularFunction)