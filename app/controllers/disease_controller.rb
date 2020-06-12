class DiseasesController < ApplicationController

    get '/' do
        erb :'disease/index'
    end
   

end