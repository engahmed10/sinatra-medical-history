class HistoriesController < ApplicationController


get '/histories/:id'  do

      @member=Member.find_by_id(params[:id])
      @member.histories
      #@histories=History.all.select{ |his| his.member_id == @member.id }
      erb :'/histories/index'
end

get '/histories/new/:id'  do
   @member = Member.find_by_id(params[:id])
   
   erb :'histories/new'
end

post '/histories/:id'   do

    @history=History.create(doctor_desc:params[:doctor_desc],doctor_name:params[:doctor_name],age_at_visit:params[:age_at_visit],date:params[:date])
    @member=Member.find_by_id(params[:id])
    @history.member = @member
    @history.save
  redirect "/histories/#{@member.id}"

end


end

