require 'spec_helper'

describe "BizToAirportRide" do
  it "BizToAirportRide", :js => true do

    @home_page.open_logout
    @home_page.make_from_airport_search

    @search_result_page.wait_for_page_load
    @search_result_page.select_car

    @checkout_page.fill_passenger_details
    @checkout_page.fill_valid_flight_details
    @checkout_page.fill_cc
    @checkout_page.reserve_car

    @reservation_confirmation_page.verify_reservation_passed


  end

end