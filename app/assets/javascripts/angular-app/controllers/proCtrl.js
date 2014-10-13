App.
  controller('ProjCtrl', ['$scope', '$routeParams', 'ProjFactory', function($scope, $routeParams, ProjFactory){
    $scope.project = function(item, proj){
      console.log(item);
      console.log(proj);
      proj.item_id = $routeParams.id
      newProj = new ProjFactory(proj);
      newProj.$save();
      item.has_projected = true;
    }
  }])


