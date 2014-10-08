App.
  factory('ItemShowFactory', ['resource', function(resource){
    return $resource('/.json')
  }])
