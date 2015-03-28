source 'https://rubygems.org'

# Declare your gem's dependencies in odania_profile.gemspec.
# Bundler will treat runtime dependencies like base dependencies, and
# development dependencies will be added by default to the :development group.
gemspec

# Declare any dependencies that are still in development here instead of in
# your gemspec. These might include edge Rails or gems from your path or
# Git. Remember to move these dependencies to your gemspec before releasing
# your gem to rubygems.org.

# To use a debugger
# gem 'byebug', group: [:development, :test]

group :development, :test do
	gem 'database_cleaner'
	gem 'rspec-rails'
	gem 'factory_girl_rails'
	gem 'ffaker'
	gem 'assert_difference'

	gem 'odania_core', git: 'https://github.com/Odania-IT/odania-core.git'

	# Necessary for travis
	platforms :jruby do
		gem 'activerecord-jdbcsqlite3-adapter'
		gem 'activerecord-jdbcmysql-adapter'
		gem 'activerecord-jdbcpostgresql-adapter'
		gem 'jruby-openssl'
	end

	platforms :mri do
		gem 'sqlite3'
		gem 'mysql2'
		gem 'pg'
	end
end

