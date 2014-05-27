require 'rspec'
require 'capybara'
require 'capybara/dsl'
require 'spec_helper.rb'
require 'selenium-webdriver'

Capybara.default_driver = :selenium
Capybara.app_host = "http://staging.limos.com"
#Selenium::WebDriver::Firefox::Binary.path="/usr/bin/firefox"
#Selenium::WebDriver::Firefox::Binary.path="/home/john/bin/firefox/firefox"

describe "BizToAirportRide" do
  it "BizToAirportRide", :js => true do

    @home_page.open_logout
    @home_page.fill_fromAirport_search

    @search_result_page.wait_for_page_load
    @search_result_page.select_car

    @checkout_page.fill_passenger_details
    @checkout_page.valid_flight_details
    @checkout_page.fill_cc
    @checkout_page.reserve_car

    @reservation_confirmation_page.verify_reservation_passed


  end

end
