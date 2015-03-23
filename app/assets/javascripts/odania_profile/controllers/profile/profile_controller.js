app.controller('OdaniaProfileProfileController', ['$location', '$scope', '$rootScope', 'OdaniaProfileProfileResource', function ($location, $scope, $rootScope, OdaniaProfileProfileResource) {
	console.log("controller :: OdaniaProfileProfileController");

	function loadProfile() {
		OdaniaProfileProfileResource.get().$promise.then(function (data) {
			$scope.profile = data.profile;
		});
	}

	loadProfile();
}]);
