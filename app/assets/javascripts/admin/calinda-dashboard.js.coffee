calindaDashboard = angular.module('calindaDashboard', [])

calindaDashboard.controller 'DashboardCtrl' , ['$scope', '$http', ($scope,$http) ->

  #fetch posts from web
  $http.get('admin/posts.json').success (data) ->
    $scope.posts = data
  
  $scope.showContent = (id) ->
    console.log id
]