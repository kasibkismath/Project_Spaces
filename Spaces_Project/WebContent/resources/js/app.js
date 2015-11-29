var spacesApp = angular.module('spacesApp', [ 'ngMessages' ]);

// services
spacesApp.service('spacesService', [ '$http', function($http) {

	var getUrl = '/spaces/getSpaces';

	this.getSpaces = function() {
		return $http.get(getUrl);
	}

} ]);

// controllers
spacesApp.controller('mainController', [
		'$scope',
		'$http',
		'spacesService',
		function($scope, $http, spacesService) {
			
			// gets the spaces from the controller api
			$scope.spaceCall = function(){
				spacesService.getSpaces().success(function(result) {
					$scope.spaces = result;
				}).error(function(data, status) {
					console.log(data);
				});
			};

			$scope.editSpaceName = '';
			$scope.editSpaceStreet = '';
			$scope.editSpaceCity = '';
			$scope.editSpaceState = '';
			$scope.editSpaceCountry = '';
			$scope.editSpaceContact = '';

			$scope.showEditDetails = function(id) {
				
				$scope.editSpaceId = id;
				
				$http.get('/spaces/getSpaceById', {
					params : {
						id : id
					}
				}).success(function(result) {
					$scope.spaceEditObj = result;
					$scope.editSpaceName = $scope.spaceEditObj.name;
					$scope.editSpaceStreet = $scope.spaceEditObj.street;
					$scope.editSpaceCity = $scope.spaceEditObj.city;
					$scope.editSpaceState = $scope.spaceEditObj.state;
					$scope.editSpaceCountry = $scope.spaceEditObj.country;
					$scope.editSpaceContact = $scope.spaceEditObj.contact;

				}).error(function(data, status) {
					console.log(data);
				});
				
			}
			
			// updates the space when the user clicks the save space button
			$scope.updateSpace = function(id, name, street, city, state,
					country, contact) {
				
				console.log(id + " " + name + " " + street + " " + city + " " + state + " " + country + " " + contact);
				
				var updatedSpace = {
					id : id,
					name : name,
					street : street,
					city : city,
					state : state,
					country : country,
					contact : contact
				};

				$http.post('/spaces/updateSpace', updatedSpace)
				.success(function(result){
					$scope.spaceCall();
					console.log("Post successfully!!");
				})
				.error(function(data, status){
					console.log("Post Unsuccessful!!!");
					console.log(data);
				});
				
			};
			
			$scope.spaceCall();

		} ]);