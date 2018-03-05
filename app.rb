require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/activerecord'
also_reload 'lib/**.*.rb'
require 'Store'
require 'Brand'
require 'StoreBrand'
require 'pry'
require 'pg'

get('/') do
  erb(:home)
end
