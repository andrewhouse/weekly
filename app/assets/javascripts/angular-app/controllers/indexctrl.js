App.
  controller('IndexCtrl', ['$scope', '$routeParams', 'IndexFactory', function($scope, $routeParams, IndexFactory){
    $scope.items = IndexFactory.query();
    $scope.order = 'updated_at'
    $scope.sort = function(select){
      $scope.order = select;
    }
  }]);

