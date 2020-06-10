require './config/environment'

if ActiveRecord::Migrator.needs_migration?
  raise 'Migrations are pending. Run `rake db:migrate` to resolve the issue.'
end


use MemberController
use DiseaseController
use HistoryController
use UserController
use ProceduresController
run ApplicationController