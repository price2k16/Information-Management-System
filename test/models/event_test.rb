require 'test_helper'

class EventTest < ActiveSupport::TestCase
  test "should be valid with title, start_time, and end_time" do
    event = Event.new(title: "Test event", start_time: DateTime.now, end_time: (DateTime.now + 30.minutes))
    assert event.valid?
  end

  test "should not be valid without start_time" do
    event = Event.new(title: "Testing event", end_time: (DateTime.now + 30.minutes))
    refute event.valid?
  end

  test "should not be valid without end_time" do
    event = Event.new(title: "Test event", start_time: DateTime.now)
    refute event.valid?
  end

  test "should not be valid without title" do
    event = Event.new(start_time: DateTime.now, end_time: (DateTime.now + 30.minutes))
    refute event.valid?
  end
end
