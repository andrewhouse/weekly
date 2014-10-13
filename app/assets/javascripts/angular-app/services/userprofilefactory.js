App.
  factory('UserProfileFactory', ['$resource', function($resource){
    return $resource('/.json')
  }])
