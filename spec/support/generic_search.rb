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

  def make_from_airport_search(container)
    select('From Airport', :from => 'service_type')
    select('11 PM', :from => 'search_pickup_time_hour')
    fill_in 'search_pickup_place', :with => 'SFO'
    fill_in 'search_drop_off_place', :with => '1070 SAN FRANCISCO, Union Street, San Francisco, CA, United States'
    select('2', :from => 'search_pax')
    @search.click_next_date
    check 'is_business'
    find_button('Get a quote').click
  end

  def open_logout
    visit Capybara.default_host + '/logout'
  end

  def wait_for_ajax
    wait_until { page.evaluate_script('$.active') == 0 }
  end

  def wait_until
    Timeout.timeout(Capybara.default_wait_time) do
      sleep(0.01) until value = yield
      value
    end
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

  def verify_user_details
    find('#info_acct').text.should == 'Acct Type: Business'
    find('#info_fname').text.should == 'First name: Leo'
    find('#info_lname').text.should == 'Last name: Pekker'
    find('#info_enter_acct_link').text.should == 'Enter Account'
  end

  def random_number
    rand 100000000
  end

end