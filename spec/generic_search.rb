require 'spec_helper'

class GenericSearch
  include Capybara::DSL

  #new functions for component object pattern
  def fields
    search.class.fields
  end

  def dropdowns
    search.class.dropdowns
  end

  #new function for component object pattern
  def fill_in_input(key, value)
    if dropdowns.has_key? key
      select value, :from => dropdowns[key]
    elsif fields.has_key? key
      fill_in fields[key], :with => value
    else
      puts 'Page does not consist element #{key}'
    end
  end

  def make_from_airport_search (container)
    select('From Airport', :from => 'service_type')
    select('11 PM', :from => 'search_pickup_time_hour')
    fill_in 'search_pickup_place', :with => 'SFO'
    fill_in 'search_drop_off_place', :with => '1070 SAN FRANCISCO, Union Street, San Francisco, CA, United States'
    select('2', :from => 'search_pax')
    @search.click_next_date
    check 'is_business'
    find_button('Get a quote').click
  end

  def click_next_date
    begin
      first('#search_ride_date').click
      randomDate = first('#calcurrent').text.to_i + 1
      find(:xpath, "//*[@id='calbody']//a[not(@class)]/../a[contains(text(), '" + randomDate.to_s + "')]").click
    rescue
      find('#calnext').click
      find(:xpath, "//*[@id='calbody']//a[not(@class)]/../a[contains(text(), '10')]").click
    end
  end

end