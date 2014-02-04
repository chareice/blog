calindaDashboard = angular.module('calindaDashboard', [])

calindaDashboard.controller 'DashboardCtrl' , ['$scope', ($scope) ->
  $scope.showContent = ->
    console.log "hello angularjs"
]