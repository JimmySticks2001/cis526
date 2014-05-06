require 'test_helper'

class ClubTest < ActiveSupport::TestCase


  #test name in club page, minimum character requirement.
  test "should have a minimum of 3 characters" do
    club = Club.new( name: ":D" )
    assert_not club.save, "Saved an club with less than 3 characters in the title"
  end
  
  #test name in create club page, maximum character requirement.
  test "should have a maximum of 56 characters" do
    long_string = ""
    
    56.times do
      long_string += "a"
    end
    assert long_string.length == 56, "Test string was not 56 characters long"

    club = Club.new( name: long_string )
    assert club.save, "Unable to save a 56 character long post"

    club = Club.new( name: long_string + "a" )
    assert_not club.save, "Saved a 57 character long post"
  end

  #test name in club page, not all whitespace requirement.
  test "should not have all whitespace" do
    long_string = ""

    20.times do
      long_string += " "
    end
    assert long_string.length == 20, "Test string was not 56 characters long"

    club = Club.new( name: long_string )
    assert_not club.save, "Saved a name with all whitespace"
  end

  #test name in create club page, must include letters requirement.
  test "must include letters" do
    club = Club.new( name: "!@%^&**(()" )
    assert_not club.save, "Saved a name with no characters"
  end 

 #test personal page link in create club page, must include http// or https//.
  test "must include http// or https//" do
    club = Club.new( club_page_link: "examplelink" )
    assert_not club.save, "Saved a club page link without including http or https"
  end 
end
