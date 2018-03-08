require('rspec')
require('store')
require('brand')
require('pry')
require('pg')

describe(Store) do
  it("checks the presence of the store name & location") do
    new_store = Store.new({:name => 'Kitten Kicks', :location => 'Las Vegas, NV'})
    expect(new_store.save).to(eq(true))
  end
end
