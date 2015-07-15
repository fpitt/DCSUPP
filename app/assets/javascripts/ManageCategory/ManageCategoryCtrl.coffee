angular.module('dcsupp').controller 'ManageCategoryCtrl', [
  '$scope'
  '$modal'
  ($scope, $modal) ->
    $scope.page = 'manage category'
    $scope.items = [
      'item1'
      'item2'
      'item3'
    ]

    $scope.changeSettings = (size) ->
      modalInstance = $modal.open(
        animation: true
        templateUrl: 'ManageCategory/ManageCategorySettings/manage_category_settings.html'
        controller: 'ManageCategorySettingsCtrl'
        size: size
        resolve: items: ->
          $scope.items
      )
      modalInstance.result.then ((selectedItem) ->
        $scope.selected = selectedItem
        return
      ), ->
      return

    $scope.viewInfo = (size) ->
      modalInstance = $modal.open(
        animation: true
        templateUrl: 'ManageCategory/ManageCategorySettings/manage_category_info.html'
        controller: 'ManageCategorySettingsCtrl'
        size: size
        resolve: items: ->
          $scope.items
      )
      modalInstance.result.then ((selectedItem) ->
        $scope.selected = selectedItem
        return
      ), ->
      return

]