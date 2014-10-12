App.
  controller('ItemShowCtrl', ['$scope','$routeParams', 'ItemShowFactory', function($scope, $routeParams, ItemShowFactory){
    $scope.item = ItemShowFactory.get({id:$routeParams.id})
  }])

