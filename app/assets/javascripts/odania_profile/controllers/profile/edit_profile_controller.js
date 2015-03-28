app.controller('OdaniaProfileEditProfileController', ['$location', '$scope', '$rootScope', 'OdaniaProfileProfileResource', '$http', function ($location, $scope, $rootScope, OdaniaProfileProfileResource, $http) {
	console.log("controller :: OdaniaProfileEditProfileController");

	function loadProfile() {
		OdaniaProfileProfileResource.get().$promise.then(function (data) {
			$scope.profile = data.profile;
			$scope.profile.skillSelection = prepareSkillData(data.profile.skills);
			$scope.data = data.data;
		});
	}

	function saveProfile() {
		// Create upload
		var fd = new FormData(),
			uploadUrl = config.getApiPath('odania_profile/profiles');

		if ($scope.upload.file) {
			fd.append('profile[image]', $scope.upload.file);
		}

		angular.forEach($scope.profile, function (value, key) {
			if (key === 'skillSelection') {
				var val = [];

				for (var i=0 ; i<value.length ; i++) {
					val.push(value[i][0]+':'+value[i][1]);
				}

				console.warn("HERE", key, value, val);

				fd.append('profile[skillSelection]', val.join(','));
			} else {
				fd.append('profile[' + key + ']', value);
			}
		});

		$http.post(uploadUrl, fd, {
			transformRequest: angular.identity,
			headers: {'Content-Type': undefined}
		}).success(function () {
			$location.path('/odania_profile/profile/index');
		}).error(function (data) {
			$scope.errors = data.errors;
		});
	}

	function prepareSkillData(skills) {
		var data = [], skill;

		for (var i = 0; i < skills.length; i++) {
			skill = skills[i];

			data.push([skill.name, skill.percent]);
		}

		return data;
	}

	/**
	 * File handling
	 */
	$scope.setFile = function (element) {
		$scope.$apply(function() {
			$scope.upload.file = element.files[0];
		});
	};
	// End file handling

	$scope.saveProfile = saveProfile;
	$scope.profile = {
		'title': null,
		'published': true
	};
	$scope.upload = {
		'file': null
	};

	loadProfile();
}]);
