filterFunction = ($sce)->
    return (val)->
        return $sce.trustAsHtml(val)


angular
  .module("sharedCommon", [])
  .filter('html', filterFunction)