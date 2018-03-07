ENV['RACK_ENV'] = 'test'

require('rspec')
require('pg')
require('sinatra/activerecord')
require('brand')
require('store')

RSpec.configure do |config|
  config.after(:each) do
    Brand.all.each do |brand|
      brand.destroy
    end
  end

  Store.all.each do |store|
    store.destroy
  end
end
