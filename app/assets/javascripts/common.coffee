filterFunction = ($sce)->
    return (val)->
        return $sce.trustAsHtml(val)

ProcessHTML = () ->
	output =

		output.bootstrapAngular = ->
			$('[ng-app]').each ->
			module = $(this).attr('ng-app')
			angular.bootstrap(this, [module])

	output


angular
  .module("sharedCommon", [])
  .filter('html', filterFunction)
  .factory("processHtml", ProcessHTML)