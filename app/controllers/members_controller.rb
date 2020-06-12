class MembersController < ApplicationController


get '/members'  do
    # binding.pry

    @user = Helpers.current_user(session)
    @members = @user.members
    #binding.pry
    if @user.members == []
        
        erb :'/members/new'
    else

       erb :'members/index'
    end

end

#get '/members/new' do


#end

post '/members' do

    member=Member.create(name:params[:name],order_age:params[:order_age],kinship:params[:kinship])
    @user = Helpers.current_user(session)
    member.user = @user 
    @user.members << member
    member.save
    @user.save
    
   # binding.pry
    redirect '/members'
end

end
