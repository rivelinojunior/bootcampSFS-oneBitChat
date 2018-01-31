# Instala as Gems
bundle check || bundle install
#roda o app sinatra
bundle exec rackup config.ru -o 0.0.0.0