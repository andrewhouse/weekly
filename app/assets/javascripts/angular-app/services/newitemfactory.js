App.
  factory('NewItemFactory', ['resource', function(resource){
    return $resource('/.json')
  }])
