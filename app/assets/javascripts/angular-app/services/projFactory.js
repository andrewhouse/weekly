App.
  factory('ProjFactory', ['$resource', function($resource){
    return $resource('/projections.json')
  }])

