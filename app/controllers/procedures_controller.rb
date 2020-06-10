class ProceduresController < ApplicationController

  # GET: /procedures
  get "/procedures" do
    erb :"/procedures/index.html"
  end

  # GET: /procedures/new
  get "/procedures/new" do
    erb :"/procedures/new"
  end

  # POST: /procedures
  post "/procedures" do
    redirect "/procedures"
  end

  # GET: /procedures/5
  get "/procedures/:id" do
    erb :"/procedures/show.html"
  end

  # GET: /procedures/5/edit
  get "/procedures/:id/edit" do
    erb :"/procedures/edit.html"
  end

  # PATCH: /procedures/5
  patch "/procedures/:id" do
    redirect "/procedures/:id"
  end

  # DELETE: /procedures/5/delete
  delete "/procedures/:id/delete" do
    redirect "/procedures"
  end
end
