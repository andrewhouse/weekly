App = angular.module('itemApp', ['ngResource', 'ngRoute', 'ui.bootstrap'])

  .config(["$httpProvider", '$locationProvider', '$routeProvider', function($httpProvider, $locationProvider, $routeProvider) {
      $httpProvider.defaults.headers.common['X-CSRF-Token'] = $('meta[name=csrf-token]').attr('content');
      $locationProvider.html5Mode(true);
      $routeProvider.when('/', {
        controller: 'HomeCtrl',
        template: 'templates/home'}).
        when('/items',{
          controller: 'IndexCtrl',
          template: 'templates/item_index'
        }).
        when('/items/:id',{
          controller: 'ItemShowCtrl', 
          template: 'templates/show_item'
        }).
        when('/profile/:id', {
          controller: "UserProfileCtrl",
          template: 'templates/profile'
        }).
        when('/items/new', {
          controller: 'NewItemCtrl',
          template: 'templates/new_item'
        }).

        otherwise({redirectTo: 'templates/home'
        })
    }])
