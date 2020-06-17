class MembersController < ApplicationController


get '/members'  do
    
   if !Helpers.is_logged_in?(session)
      redirect '/login'
   end

    @user = Helpers.current_user(session)
    @members = @user.members
  
    if @user.members == []       
        redirect '/members/new'
    else
       erb :'members/index'
    end

end


get '/members/new'  do
   
    erb :'members/new'
end

post '/members' do

    if !Helpers.is_logged_in?(session)
        redirect '/login'
    end
    member=Member.create(name:params[:name],order_age:params[:order_age],kinship:params[:kinship])
    user = Helpers.current_user(session)
    member.user = user 
    user.members << member
    
    redirect '/members'
end




end
