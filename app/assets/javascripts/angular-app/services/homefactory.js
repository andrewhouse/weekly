App.
  factory('HomeFactory', ['$resource', function($resource){
    return $resource('/home.json')
  }])
