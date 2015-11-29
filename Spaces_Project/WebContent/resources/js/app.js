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
				})
				.error(function(data, status){
					console.log(data);
				});
				
			};
			
			// adds a new space
			$scope.addSpace = function(){
				
				// check state has value, else "null"
				var state = $scope.addSpaceSate || null;
				
				// get's the username from the add new space form - hidden input
				var username = angular.element(document.getElementsByName('currentUser')[0]).val();
				
				var addedSpace = {
					name : $scope.addSpaceName,
					street : $scope.addSpaceStreet,
					city : $scope.addSpaceCity,
					state : state,
					country : $scope.addSpaceCountry,
					contact : $scope.addSpaceContact,
					user : {
						email:"",
						username:username,
						password:"",
						authority:"",
						enabled:true
						}
				};
				
				
				$http.post('/spaces/addSpace', addedSpace)
				.success(function(result){
					$scope.spaceCall();
					
					$scope.addSpaceName = '';
					$scope.addSpaceStreet = '';
					$scope.addSpaceCity = '';
					$scope.addSpaceState = '';
					$scope.addSpaceCountry = '';
					$scope.addSpaceContact = '';
				})
				.error(function(data, status){
					console.log(data);
				})
			};
			
			$scope.spaceCall();

		} ]);