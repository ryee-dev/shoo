require('sinatra')
require('sinatra/reloader')
require('sinatra/activerecord')
also_reload('lib/**.*.rb')
require('lib/store')
require('lib/brand')
require('lib/store_brand')
require('pry')
require('pg')

get('/') do
  erb(:input)
end

get('/output') do
  erb(:output)
end
