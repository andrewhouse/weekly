App.
  factory('NewItemFactory', ['$resource', function($resource){
    return $resource('/items/new.json')
  }])
