class ProceduresController < ApplicationController

  # GET: /procedures
  get '/members/:id/procedures' do

    @member=Member.find_by_id(params[:id])
    authorize(@member)
    erb :"/procedures/index"
  end

  # GET: /procedures/new
  get "/members/:id/procedures/new" do
      @member=Member.find_by_id(params[:id])
      authorize(@member)
      @diseases=Helpers.all_desease(session)
      erb :"/procedures/new"
  end

  # POST: /procedures
  post "/members/:id/procedures" do
    
    diseases=Helpers.all_desease(session)
    member=Member.find_by_id(params[:id])
    authorize(member)
    procedure=Procedure.create(name:params[:name],desc:params[:desc],proce_doctor:params[:proce_doctor],
    hospital:params[:hospital],date_porc:params[:date_porc],age_at_proc:params[:age_at_proc])

    if params["disease"]["name"] != nil
       
      disease=Disease.create(name:params["disease"]["name"],desc:params["disease"]["desc"])
      procedure.disease =  disease
    else
      procedure.disease  = diseases.select{|dis| dis[procedure_id].to_i == dis.id }.first
         
    end
    procedure.save
    @member.procedures << procedure
    flash[:message]="Successfully created procedure"
    redirect "/members/#{member.id}/procedures/#{procedure.id}"
  end

  get "/members/:id/procedures/:id1" do
    @procedure = Procedure.find_by_id(params[:id1])
    
    erb :"/procedures/show"
  end

  get "/members/:id/procedures/:id1/edit" do
       @member=Member.find_by_id(params[:id])
       authorize(@member)
       @procedure = Procedure.find_by_id(params[:id1])
       @diseases=Helpers.all_desease(session)
       erb :"/procedures/edit"
  end

  patch "/members/:id/procedures/:id1" do

    diseases=Helpers.all_desease(session)
    member=Member.find_by_id(params[:id])
    authorize(member)
    procedure=Procedure.find_by_id(params[:id1])
    procedure.update(name:params[:name],desc:params[:desc],proce_doctor:params[:proce_doctor],
    hospital:params[:hospital],date_porc:params[:date_porc],age_at_proc:params[:age_at_proc])

    if params["disease"]["name"] != nil
      disease=Disease.create(name:params["disease"]["name"],desc:params["disease"]["desc"])
      procedure.disease =  disease
    else
      procedure.disease  = diseases.select{|dis| dis[procedure_id].to_i == dis.id }.first
    end
    procedure.save
    member.procedures << procedure
    flash[:message]="Successfully updated procedure"
    redirect "/members/#{member.id}/procedures/#{procedure.id}"

  end

  delete "/members/:id/procedures/:id1" do
    member=Member.find_by_id(params[:id])
    authorize(member)
    procedure=Procedure.find_by_id(params[:id1])
    procedure.destroy
    redirect "/members/#{member.id}/procedures"
  end
end
