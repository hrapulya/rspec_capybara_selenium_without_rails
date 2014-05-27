require 'spec_helper'
require 'support/generic_search.rb'
require 'support/test_helper.rb'

class SearchResultPage < GenericSearch

  def wait_for_page_load
    wait_until { page.all("#all_search_results").count > 0 }
    wait_until { page.all(:link, "Select").count > 0 }

  end

  def select_car
    sleep 5
    wait_until { page.all(:link, "Select").count > 0 }
	  links_count = page.all(:link, 'Select', :visible => true).count
	  link_number = rand(links_count) + 1
	  page.all(:link, 'Select', :visible => true)[link_number].click
	  puts "Page consists #{links_count} SELECT links. And I clicked on #{link_number} link"
  end
end