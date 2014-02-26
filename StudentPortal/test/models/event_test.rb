require 'test_helper'

class EventTest < ActiveSupport::TestCase


  #test title in create event page, minimum character requirement.
  test "should have a minimum of 3 characters" do
    event = Event.new( title: ":D" )
    assert_not event.save, "Saved an event with less than 3 characters in the title"
  end
  
  #test title in create event page, maximum character requirement.
  test "should have a maximum of 56 characters" do
    long_string = ""
    
    56.times do
      long_string += "a"
    end
    assert long_string.length == 56, "Test string was not 56 characters long"

    event = Event.new( title: long_string )
    assert event.save, "Unable to save a 56 character long post"

    event = Event.new( title: long_string + "a" )
    assert_not event.save, "Saved a 57 character long post"
  end

  #test title in create event page, not all whitespace requirement.
  test "should not have all whitespace" do
    long_string = ""

    20.times do
      long_string += " "
    end
    assert long_string.length == 20, "Test string was not 56 characters long"

    event = Event.new( title: long_string )
    assert_not event.save, "Saved a title with all whitespace"
  end

  #test title in create event page, must include letters requirement.
  test "must include letters" do
    event = Event.new( title: "!@%^&**(()" )
    assert_not event.save, "Saved a title with no characters"
  end 






end
