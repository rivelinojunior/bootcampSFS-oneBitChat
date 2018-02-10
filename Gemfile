source :rubygems
gem 'sinatra'
gem "activerecord"
gem "sinatra-activerecord"
gem 'pg', '~> 0.18'
gem 'pg_search'
gem 'rake'

group :development do
 gem "tux"
end

group :development, :test do
  gem 'byebug', platform: :mri
  gem 'pry-byebug'
end

group :test do
  gem "rack-test", require: "rack/test"
  gem "rspec"
  gem "factory_girl", "~> 4.0"
  gem "ffaker"  
  gem 'database_cleaner'
end