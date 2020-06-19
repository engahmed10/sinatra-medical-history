class DiseasesController < ApplicationController

    get '/diseases' do

        @all_diseases = Helpers.all_desease(session)
        erb :'/diseases/index'

    end 
   

    get '/diseases/:id' do
         
        @all_diseases = Helpers.all_desease(session)
        erb :'/diseases/index'

    end 

end