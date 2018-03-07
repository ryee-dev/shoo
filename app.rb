require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/activerecord'
also_reload 'lib/**.*.rb'
require './lib/store'
require './lib/brand'
require './lib/store_brand'
require 'pry'
require 'pg'

get('/') do
  erb(:home)
end

get '/add-store' do
  erb(:add_store)
end
