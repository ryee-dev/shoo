require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/activerecord'
also_reload 'lib/**.*.rb'
require './lib/store'
require './lib/brand'
require 'pry'
require 'pg'

get '/' do
  erb :home
end

get '/stores' do
  @all_stores = Store.all
  erb :stores
end

post '/stores' do
  erb :stores
end

get '/brands' do
  erb :brands
end

post '/brands' do
  erb :brands
end

get '/add-store' do
  erb :add_store
end

post '/add-store' do
  store_name = params[:store_name]
  store_location = params[:store_location]
  store = Store.create({:store_name => store_name, :store_location => store_location})
  @all_stores = Store.all
  erb :add_store
end
