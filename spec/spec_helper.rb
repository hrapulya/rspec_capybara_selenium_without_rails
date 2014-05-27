require 'rspec/autorun'
require 'capybara/rspec'
require 'capybara/rails'
require 'rspec/rails'


RSpec.configure do |config|
	config.include Capybara::DSL
end

# Requires supporting ruby files with custom matchers and macros, etc,
# in spec/support/ and its subdirectories.
Dir[Rails.root.join("spec/support/**/*.rb")].each {|f| require f}
Capybara.register_driver :selenium do |app|
  require 'selenium/webdriver'
  Selenium::WebDriver::Firefox::Binary.path = "/opt/firefox/firefox"
  Capybara::Selenium::Driver.new(app, :browser => :firefox)
end
Capybara.default_host = 'http://staging.limos.com'
Capybara.default_wait_time = 120

config.before(:all) do
  @home_page                       = Home_page.new
  @login_page                      = LoginPage.new
  @admin_page                      = AdminPage.new
  @admin_make_reservation_page     = AdminMakeReservationPage.new
  @search_result_page              = SearchResultPage.new
  @checkout_page                   = CheckoutPage.new
  @reservation_confirmation_page   = ReservationConfirmationPage.new
  @search                          = GenericSearch.new
  @contact_info_page               = ContactInfoPage.new
end

config.after(:all) do
end