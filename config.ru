require './config/environment'

if ActiveRecord::Migrator.needs_migration?
  raise 'Migrations are pending. Run `rake db:migrate` to resolve the issue.'
end


use Rack::MethodOverride

use UsersController
use MembersController
use DiseasesController
use HistoriesController
use ProceduresController
run ApplicationController