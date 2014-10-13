App.
  factory('ItemShowFactory', ['$resource', function($resource){
    return $resource('/items/:id.json',
      {id: '@id'},
      {})
  }])
