require 'test_helper'

class EventTest < ActiveSupport::TestCase
  def setup
    @user = User.new(name: "Example User", email: "user@example.com",
                     password: "foobar")
    @event = Event.new(name: "Example User", date: Time.now, user: @user)
  end

  test "should be valid" do
    assert @event.valid?
  end

  test "name should be present" do
    assert_not @event.name.nil?
  end

  test "date should be present" do
    assert_not @event.date.nil?
  end

  test "event should be present" do
    assert_not @event.user.nil?
  end
end
