require 'spec_helper'
require 'support/generic_search.rb'

class BaseTest
  
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