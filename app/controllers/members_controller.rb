class MembersController < ApplicationController

get '/members'  do
    
    erb :'members/index'
end

get '/members/show/:id'  do
   @member=Member.find_by_id(params[:id]) 
  erb :'members/show'
end


end
