App.
  controller('NewItemCtrl', ['$scope','$routeParams', 'NewItemFactory', function($scope, $routeParams, NewItemFactory){
    $scope.item = NewItemFactory.query();
  }])

