Rails.application.routes.draw do
	namespace :odania_profile do
		namespace :protected do
			get 'profiles' => 'profiles#index'
			post 'profiles' => 'profiles#update'
		end

		resources :profiles, only: [:index, :show]
	end

	namespace :protected do
		namespace :api, defaults: {format: :json} do
			namespace :odania_profile do
				get 'profiles' => 'profiles#index'
				post 'profiles' => 'profiles#update'
			end
		end
	end
end
