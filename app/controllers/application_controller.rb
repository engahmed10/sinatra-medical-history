require './config/environment'
#require 'sinatra/flash'



class ApplicationController < Sinatra::Base
 # use Rack::Flash

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret ,"password_security"
   # set :session_secret, ENV.fetch('SESSION_SECRET') 
    #register Sinatra::Flash
  end



  self.helpers do

    def authorize(member)
        redirect "/members"  if member.user != Helpers.current_user(session)     
    end

    def authorize_history(member,history)
    
      redirect "/members/#{member.id}/histories"  if history.member_id != member.id 
    end
    
    def  authorize_procedure(member,procedure)
         
         redirect "/members/#{member.id}/procedures"   if procedure.member_id != member.id
    end

  end


end





