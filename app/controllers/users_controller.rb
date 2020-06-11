class UsersController < ApplicationController


    get '/' do
      
     erb :'index'
    end

####signup
    get '/signup'  do
      if  Helpers.is_logged_in?(session)
            redirect "/members"
      else
           erb :"users/signup"
      end

    end 
    
    post '/signup'  do
       if params[:username] == "" || params[:email] == ""||params[:password_digest] == ""
          redirect '/signup'
       end
       @user =User.create(username:params[:username],email:params[:email],password_digest:params[:password_digest])
       session[:user_id]=@user.id 
      # @user.save
      redirect "/members"
    end
    ###login


    get '/login'  do
        if  Helpers.is_logged_in?(session)
            redirect "/members"
        else
           erb :"users/login"
        end
     
    end

    post "/login"  do
        @user=User.find_by(username:params[:username])
        if session[:user_id] == @user.id
           redirect '/members'
        else
           redirect '/login'
        end

    end



end