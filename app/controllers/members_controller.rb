class MembersController < ApplicationController

get '/members'  do

    erb :'members/index'
end

end
