app.factory('OdaniaProfileProfileResource', ['$resource', function ($resource) {
	var basePath = config.getApiPath('odania_profile/profiles');

	return $resource(basePath);
}]);
