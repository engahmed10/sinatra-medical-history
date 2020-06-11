ENV["SINATRA_ENV"] ||= "development"
require_relative './config/environment'
require 'sinatra/activerecord/rake'


desc 'drop into the Pry console'

# Type `rake -T` on your command line to see the available rake tasks.

task :console do
  Pry.start
end
