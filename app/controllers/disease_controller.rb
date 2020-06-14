class DiseasesController < ApplicationController

    get '/diseases' do

        @all_diseases =[]
        all_histories =[]
        members= Helpers.current_user(session).members
        members.each do |member| 
            member.histories.each do |his| 
               all_histories << his
               @all_diseases << his.disease
            end
        end
        @all_diseases

        #@all_diseases.each do |i|
          #  i
           # binding.pry
       # end
        #all_histories 
       # binding.pry
       # member.histories 
        #history.disease =
        #disease.histories =
       # binding.pry
        erb :'/diseases/index'
    end
   

end