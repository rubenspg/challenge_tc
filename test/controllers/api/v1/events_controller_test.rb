require 'test_helper'

class Api::V1::EventsControllerTest < ActionController::TestCase
  def setup
    @events = events(:testEvent)
  end

end
