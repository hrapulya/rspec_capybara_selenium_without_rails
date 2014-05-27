require 'spec_helper'

class HomePage < GenericSearch
  include Capybara::DSL

  def search.fields
    {
        :pick_up_place        => 'search_pickup_place',
        :drop_off_place       => 'search_drop_off_place'
    }
  end

  def search.dropdowns
    {
        :service_type 		    => 'service_type',
        :passengers_count     => 'search_pax',
        :pick_up_time_hour    => 'search_pickup_time_hour',
        :pick_up_time_minute  => 'search_pickup_time_minute',
        :drop_off_time_hour   => 'search_drop_off_time_hour',
        :drop_off_time_minute => 'search_drop_off_time_minute'
    }
  end
end