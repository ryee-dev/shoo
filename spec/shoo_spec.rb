require('rspec')
require('store')
require('pry')
require('pg')

describe(Store) do
  it("validates the presence of the store name") do
    expect(store.save).to(eq(false))
  end
end
