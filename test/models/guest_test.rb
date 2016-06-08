require 'test_helper'

class GuestTest < ActiveSupport::TestCase
  def setup
    @guest = Guest.new(name: "Example User")
    @guest.event = Event.new(name: "Test")
  end

  test "should be valid" do
    assert @guest.valid?
  end

  test "name should be present" do
    assert_not @guest.name.nil?
  end

  test "event should be present" do
    assert_not @guest.event.nil?
  end
end
