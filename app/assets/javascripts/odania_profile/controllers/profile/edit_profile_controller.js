app.controller('OdaniaProfileEditProfileController', ['$location', '$scope', '$rootScope', 'OdaniaProfileProfileResource', function ($location, $scope, $rootScope, OdaniaProfileProfileResource) {
	console.log("controller :: OdaniaProfileEditProfileController");

	function loadProfile() {
		OdaniaProfileProfileResource.get().$promise.then(function (data) {
			$scope.profile = data.profile;
			$scope.profile.skillSelection = prepareSkillData(data.profile.skills);
		});
	}

	function saveProfile() {
		OdaniaProfileProfileResource.save({profile: $scope.profile}).$promise.then(function () {
			$location.path('/odania_profile/profile/index');
		}, function (data) {
			console.log("errors", data);
			$scope.errors = data.data.errors;
		});
	}

	function prepareSkillData(skills) {
		var data = [], skill;

		for (var i=0 ; i<skills.length ; i++) {
			skill = skills[i];

			data.push([skill.name, skill.percent]);
		}

		return data;
	}

	$scope.saveProfile = saveProfile;
	$scope.profile = {
		'title': null,
		'published': true
	};

	loadProfile();
}]);
