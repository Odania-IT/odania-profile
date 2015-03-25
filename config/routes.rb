Rails.application.routes.draw do
	namespace :odania_profile do
		namespace :protected do
			get 'profiles' => 'profiles#index'
			post 'profiles' => 'profiles#update'
		end
	end

	namespace :protected do
		namespace :api, defaults: {format: :json} do
			namespace :odania_profile do
				get 'profiles' => 'profiles#index'
				post 'profiles' => 'profiles#update'
			end
		end
	end

	scope '/:locale', constraints: {locale: /[a-z][a-z]/} do
		namespace :odania_profile do
			get 'profiles' => 'profiles#index'
			get 'profiles/:id' => 'profiles#show'
		end
	end
end
