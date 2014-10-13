App.
  controller('ItemShowCtrl', ['$scope','$routeParams', 'ItemShowFactory', function($scope, $routeParams, ItemShowFactory){
    $scope.item = ItemShowFactory.get({id:$routeParams.id})
    $scope.hasProjected = function(){
      return "hello"
    }
    $scope.hideForm = function(item){
        item.isVisible = false;
    }
  }])

