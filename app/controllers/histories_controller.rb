class HistoriesController < ApplicationController


get '/members/:id/histories'  do
     @member = Member.find(params[:id])
     authorize(@member)
    erb :'/histories/index'
end

get '/members/:id/histories/new'  do
    @member = Member.find(params[:id])
    authorize(@member)
    @diseases = Helpers.all_desease(session)
   erb :'histories/new'
end

post '/members/:id/histories' do
     @member = Member.find(params[:id]) 
     authorize(@member)
     diseases= Helpers.all_desease(session)
     @history=History.create(doctor_desc:params[:doctor_desc],doctor_name:params[:doctor_name],
        age_at_visit:params[:age_at_visit],date:params[:date])
     if params["disease"]["name"] != "" 
        disease = Disease.create(name:params["disease"]["name"],desc:params["disease"]["desc"])
        @history.disease = disease 
     else

       if params["history"]  != nil 
          @history.disease = diseases.select{ |dis| params["history"]["disease_id"].to_i == dis.id }.first 
        else
          redirect "/members/#{@member.id}/histories/new"     
        end
     end
     @history.save 
     @member.histories << @history

  redirect "/members/#{@member.id}/histories/#{@history.id}"
end

get  "/members/:id/histories/:id1"  do
      @member = Member.find(params[:id]) 
      authorize(@member)
      @history=History.find(params[:id1])

      authorize_history(@member,@history)
      @disease = @history.disease  
  erb :'histories/show'
end


get "/members/:id/histories/:id1/edit"   do
  
    @member = Member.find(params[:id]) 
    authorize(@member)
    @history=History.find(params[:id1])
    authorize_history(@member,@history)
    @diseases = Helpers.all_desease(session)

    erb :'histories/edit'
end


patch "/members/:id/histories/:id1"  do
    @member = Member.find(params[:id]) 
    authorize(@member)
    @history=History.find(params[:id1])
    authorize_history(@member,@history)
    diseases= Helpers.all_desease(session)
    @history.update(doctor_desc:params[:doctor_desc],doctor_name:params[:doctor_name],
    age_at_visit:params[:age_at_visit],date:params[:date])
    
    if params["disease"]["name"] != ""
         disease=Disease.create(name:params["disease"]["name"],desc:params["disease"]["desc"])
         @history.disease= disease 
     else
       #binding.pry
        @history.disease = diseases.select{ |dis| params["history"]["disease_id"].to_i == dis.id }.first     
     end

     @history.save 
     @member.histories << @history 
     redirect "/members/#{@member.id}/histories/#{@history.id}"
end


delete "/members/:id/histories/:id1"  do
    @member = Member.find(params[:id]) 
    authorize(@member)
    @history=History.find(params[:id1])
    authorize_history(@member,@history)
    @history.destroy
    redirect "/members/#{@member.id}/histories"
end


end

