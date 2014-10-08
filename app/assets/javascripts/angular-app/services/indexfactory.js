App.
  factory('IndexFactory', ['resource', function(resource){
    return $resource('/.json')
  }])
