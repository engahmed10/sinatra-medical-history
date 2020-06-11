class HistoriesController < ApplicationController

get '/histories/index'  do

      @histories=History.all.select{ |his| his.id == his.member_id }
    erb :'/histories/index'
end

get /histories/new






end