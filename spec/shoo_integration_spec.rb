require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

# describe 'the store creation path', {:type => :feature} do
#   it 'path where user can create a store' do
#     visit '/stores'
#     fill_in('store_name', :with => 'Test')
#     click_button('Add Store')
#     expect(page).to have_content('Test')
#   end
# end
