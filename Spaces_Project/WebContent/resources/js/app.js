var spacesApp = angular.module('spacesApp', []);

// services
spacesApp.service('spacesService', [ '$http', function($http) {

	var getUrl = '/spaces/getSpaces';

	this.getSpaces = function() {
		return $http.get(getUrl);
	}

} ]);

// controllers
spacesApp.controller('mainController', [ '$scope', 'spacesService',
		function($scope, spacesService) {

			spacesService.getSpaces().success(function(result) {
				$scope.spaces = result;
			}).error(function(data, status) {
				console.log(data);
			});

		} ]);