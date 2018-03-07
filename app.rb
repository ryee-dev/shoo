require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/activerecord'
also_reload 'lib/**.*.rb'
require './lib/store'
require './lib/brand'
require './lib/store_brand'
require 'pry'

get '/' do
  erb :home
end

get '/stores' do
  @all_stores = Store.all
  erb :stores
end

post '/stores' do
  store_name = params[:store_name]
  store_location = params[:store_location]
  Store.create({:name => store_name, :location => store_location})
  @all_stores = Store.all
  erb :stores
end

get '/brands' do
  @all_brands = Brand.all
  erb :brands
end

get '/add-store' do
  erb :add_store
end

post '/add-store' do
  store_name = params[:store_name]
  store_location = params[:store_location]
  Store.create({:name => store_name, :location => store_location})
  @all_stores = Store.all
  erb :add_store
end

get '/stores/:id' do
  @store = Store.find(params[:id].to_i)
  @all_brands = Brand.all
  @store_brands = @store.brands
  erb :edit_store
end

patch '/stores/:id' do
  updated_name = params[:update_name]
  @store_id = params[:id].to_i
  @store = Store.find(@store_id)
  @store.update(:name => updated_name)
  redirect "/stores/#{@store_id.to_s}"
end
