require('rspec')
require('store')
require('pry')
require('pg')

describe(Store) do
  it("validates the presence of the store name") do
    new_store = Store.new({:name => 'Kitten Kicks', :location => 'Las Vegas, NV'})
    expect(new_store.save).to(eq(true))
  end
end
