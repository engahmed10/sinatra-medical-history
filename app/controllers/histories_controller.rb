class HistoriesController < ApplicationController


get '/members/:id/histories'  do
   # binding.pry
     @member = Member.find(params[:id])
    erb :'/histories/index'
end

get '/members/:id/histories/new'  do
    @member = Member.find(params[:id])
   erb :'histories/new'
end

post '/members/:id/histories' do
   # @user = Helpers.current_user(session)
    @member = Member.find(params[:id]) 
    #if @member.user == @user

        @history=History.create(doctor_desc:params[:doctor_desc],doctor_name:params[:doctor_name],
        age_at_visit:params[:age_at_visit],date:params[:date])
        @member.histories << @history 
         
   # end
  redirect "/members/#{@member.id}/histories"

end

get "/members/:id/histories/:id1/edit"   do
    @history=History.find(params[:id1])
    @member = Member.find(params[:id]) 
    erb :'histories/edit'
end


patch "/members/:id/histories/:id1"  do
    @member = Member.find(params[:id]) 
    @history=History.find(params[:id1])
    @history.update(doctor_desc:params[:doctor_desc],doctor_name:params[:doctor_name],
    age_at_visit:params[:age_at_visit],date:params[:date])
  
    redirect "/members/#{@member.id}/histories"

end


delete "/members/:id/histories/:id1"  do
    @member = Member.find(params[:id]) 
    @history=History.find(params[:id1])
    @history.destroy
    redirect "/members/#{@member.id}/histories"
end



end

