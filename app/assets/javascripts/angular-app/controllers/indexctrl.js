App.
  controller('IndexCtrl', ['$scope', '$routeParams', 'IndexFactory', function($scope, $routeParams, IndexFactory){
    $scope.items = IndexFactory.query();
    $scope.order = 'updated_at'
    $scope.orderTitle = 'Recently Updated'
    $scope.sort = function(select){
      if(select == 'Oldest'){
        $scope.order = '-created_at';
        $scope.orderTitle = select 
      }else if(select == 'Recently Updated'){
        $scope.order = 'updated_at'
        $scope.orderTitle = select 
      }else if(select == 'Newest'){
        $scope.order = 'created_at'
        $scope.orderTitle = select 
      }else if(select == 'Title( A - Z )'){
        $scope.order = '-title'
        $scope.orderTitle = select 
      }else if(select == 'Title( Z - A )'){
        $scope.order = 'title'
        $scope.orderTitle = select 
      } else{
        $scope.order = select;
        $scope.orderTitle = select 
      }
    }
  }]);

