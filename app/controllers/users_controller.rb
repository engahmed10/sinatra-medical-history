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
       if params[:username] == "" || params[:email] == "" || params[:password] == ""
          redirect '/signup'
       end
       @user =User.create(username:params[:username],email:params[:email],password:params[:password])
       session[:user_id]=@user.id 
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
        if params[:username] == "" ||  params[:password] == ""
            redirect '/login'
        end
        user=User.find_by(username:params[:username])
        if user && user.authenticate(params[:password]) 
            session[:password] = @user.id
           redirect '/members'
        else
           redirect '/login'
        end
    end

    get '/logout'  do  
        session.destroy
        redirect '/'
    end



end