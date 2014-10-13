App.
  controller('IndexCtrl', ['$scope', '$routeParams', 'IndexFactory', function($scope, $routeParams, IndexFactory){
    $scope.items = IndexFactory.query();
  }]);

