var App = angular.module('itemApp', ['ngResource', 'ngRoute', 'ui.bootstrap'])

  .config(["$httpProvider", '$locationProvider', '$routeProvider', '$sceDelegateProvider', function($httpProvider, $locationProvider, $routeProvider, $sceDelegateProvider) {
      $httpProvider.defaults.headers.common['X-CSRF-Token'] = $('meta[name=csrf-token]').attr('content');
      // Need the whitelist because angulat didn't like amazon s3.
      $sceDelegateProvider.resourceUrlWhitelist([
        'self', 
        'http://s3.amazonaws.com/finalprojectweekly/images/pictures/000/000/**'])
      $routeProvider.
        when('/home', {
          controller: 'HomeCtrl',
          templateUrl: 'templates/home_page'
        }).
        when('/items',{
          controller: 'IndexCtrl',
          templateUrl: 'templates/item_index'
        }).
        when('/items/new', {
          controller: 'NewItemCtrl',
          templateUrl: 'templates/new_item'
        }).
        when('/items/:id',{
          controller: 'ItemShowCtrl', 
          templateUrl: 'templates/show_item'
        }).
        when('/profile/:id', {
          controller: "UserProfileCtrl",
          templateUrl: 'templates/profile'
        }).when('/', {
          controller: 'HomeCtrl',
          templateUrl: 'templates/home_page'
        }).
        otherwise({redirectTo: 'templates/item_index'
        })
    }])

.controller('CarouselDemoCtrl', ['$scope', 'HomeFactory', function ($scope, HomeFactory) {
    $scope.home = HomeFactory.get(function(home){
      console.log(home);
    });
    
  $scope.myInterval = 5000;
  var slides = $scope.slides = [];
}])

.controller('TabsDemoCtrl', ['$scope', '$location', function($scope, $location){
 $scope.go = function ( path ) {
   $location.path( path );
 }; 

 $scope.tabs = [
    { link: '#/', label: "Weekly"}, 
    { link: '#/items', label: "Items"}, 
  ]

  $scope.selectedTab = $scope.tabs[0];

  $scope.setSelectedTab = function(tab){
    $scope.selctedTab = tab;
  }

  $scope.tabClass = function(tab){
    if ($scope.selectedTab == tab) {
      return 'active';
    } else {
      return '';
    }
  }
}])

.controller('DropdownCtrl', ['$scope', function ($scope) {
  $scope.choices = [
    'title',
    'description',
    'created_at',
    'updated_at'
  ];

  $scope.status = {
    isopen: false
  };

  $scope.toggled = function(open) {
    console.log('Dropdown is now: ', open);
  };

  $scope.toggleDropdown = function($event) {
    $event.preventDefault();
    $event.stopPropagation();
    $scope.status.isopen = !$scope.status.isopen;
  };
}])

.filter('capitalize', function() {
    return function(input, all) {
      return (!!input) ? input.replace(/([^\W_]+[^\s-]*) */g, function(txt){return txt.charAt(0).toUpperCase() + txt.substr(1).toLowerCase();}) : '';
    }
  })
