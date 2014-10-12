App.
  controller('ProjCtrl', ['$scope', '$routeParams', 'ProjFactory', function($scope, $routeParams, ProjFactory){
    $scope.project = function(item, proj){
      item.$save(proj);
    }
  }])


