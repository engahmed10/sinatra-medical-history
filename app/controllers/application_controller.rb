require './config/environment'
require "rack-flash"
class ApplicationController < Sinatra::Base
  use Rack::Flash

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret ,"password_security"
    use Rack::Flash
  end


  self.helpers do

    def authorize(member)
        redirect "/members"  if member.user != Helpers.current_user(session)     
    end

    def authorize_history(member,history)
      redirect "/members/#{member.id}/histories"  if histroy.member_id != member.id
    end
    
    def  authorize_procedure(member,procedure)
         
         redirect "/members/#{member.id}/procedures"   if procedure.member_id != member.id
    end

  end


end



