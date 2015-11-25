var spacesApp = angular.module('spacesApp', ['ngMessages']);

// services
spacesApp.service('spacesService', [ '$http', function($http) {

	var getUrl = '/spaces/getSpaces';

	this.getSpaces = function() {
		return $http.get(getUrl);
	}

} ]);

// controllers
spacesApp.controller('mainController', [ '$scope', '$http', 'spacesService',
		function($scope, $http, spacesService) {

			// gets the spaces from the controller api
			spacesService.getSpaces()
			.success(function(result) {
				$scope.spaces = result;
			}).error(function(data, status) {
				console.log(data);
			});
			
			$scope.editSpaceStreet = '';

			$scope.showEditDetails = function(id) {
				$http.get('/spaces/getSpaceById', {
			        params: {
			            id : id
			        }
			     })
			     .success(function (result) {
			          $scope.spaceEditObj = result;
			          $scope.editSpaceStreet = $scope.spaceEditObj.street;
			     })
				.error(function (data, status){
					console.log(data);
				});
				
				console.log($scope.editSpaceStreet);
			}
			
}]);