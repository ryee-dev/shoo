require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/activerecord'
also_reload 'lib/**.*.rb'
require './lib/store'
require './lib/brand'
require 'pry'

get '/' do
  erb :home
end

get '/stores' do
  @all_stores = Store.all
  @all_brands = Brand.all
  erb :stores
end

get '/brands' do
  @all_brands = Brand.all
  @all_stores = Store.all
  erb :brands
end

post '/stores' do
  store_name = params[:store_name]
  store_location = params[:store_location]
  Store.create({:name => store_name, :location => store_location})
  @all_stores = Store.all
  erb :stores
end

post '/brands' do
  brand_name = params[:brand_name]
  brand_price = params[:brand_price]
  Brand.create({:name => brand_name, :price => brand_price})
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

get '/add-brand' do
  erb :add_brand
end

post '/add-brand' do
  brand_name = params[:brand_name]
  brand_price = params[:brand_price]
  Brand.create({:name => brand_name, :price => brand_price})
  @all_brands = Brand.all
  erb :add_brand
end

get '/stores/:id' do
  @store = Store.find(params[:id])
  @all_brands = Brand.all
  @assigned_brands = @store.brands
  erb :edit_store
end

patch '/stores/:id' do
  updated_name = params[:update_name]
  updated_location = params[:update_location]
  @id = params[:id].to_i
  @store = Store.find(@id)
  @store.update(:name => updated_name, :location => updated_location)
  @all_brands = Brand.all
  erb :edit_store
end

post '/stores/:id/brands' do
  store_id = params[:id].to_i
  brands_id = params[:brands_id].to_i
  current_brands = Brand.find(brands_id)
  @store = Store.find(store_id)
  @store.brands.push(current_brands)
  @assigned_brands = @store.brands
  @all_brands = Brand.all
  erb :edit_store
end

delete '/stores/:id' do
  store_id = params[:id].to_i
  @store = Store.find(store_id)
  @store.destroy
  @all_stores = Store.all
  redirect '/stores'
end

get '/brands/:id' do
  @brand = Brand.find(params[:id].to_i)
  @all_brands = Brand.all
  @all_stores = Store.all
  @assigned_brands = @store.brands
  erb :edit_brand
end

patch '/brands/:id' do
  updated_name = params[:update_name]
  updated_price = params[:update_price]
  @brand_id = params[:id].to_i
  @brand = Brand.find(@brand_id)
  @brand.update(:name => updated_name, :price => updated_price)
  @all_stores = Store.all
  @all_brands = Brand.all
  erb :edit_brand
end

delete '/brands/:id' do
  @brand_id = params[:id].to_i
  @brand = Brand.find(@brand_id)
  @brand.destroy
  @all_brands = Brand.all
  redirect '/brands'
end
