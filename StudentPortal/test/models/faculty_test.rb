require 'test_helper'

class FacultyTest < ActiveSupport::TestCase


  #test name in faculty page, minimum character requirement.
  test "should have a minimum of 3 characters" do
    faculty = Faculty.new( name: ":D" )
    assert_not faculty.save, "Saved an faculty with less than 3 characters in the title"
  end
  
  #test name in create faculty page, maximum character requirement.
  test "should have a maximum of 56 characters" do
    long_string = ""
    
    56.times do
      long_string += "a"
    end
    assert long_string.length == 56, "Test string was not 56 characters long"

    faculty = Faculty.new( name: long_string )
    assert faculty.save, "Unable to save a 56 character long post"

    faculty = Faculty.new( name: long_string + "a" )
    assert_not faculty.save, "Saved a 57 character long post"
  end

  #test name in faculty page, not all whitespace requirement.
  test "should not have all whitespace" do
    long_string = ""

    20.times do
      long_string += " "
    end
    assert long_string.length == 20, "Test string was not 56 characters long"

    faculty = Faculty.new( name: long_string )
    assert_not faculty.save, "Saved a name with all whitespace"
  end

  #test name in create faculty page, must include letters requirement.
  test "must include letters" do
    faculty = Faculty.new( name: "!@%^&**(()" )
    assert_not faculty.save, "Saved a name with no characters"
  end 

 #test personal page link in create faculty page, must include http// or https//.
  test "must include http// or https//" do
    faculty = Faculty.new( personal_page_link: "examplelink" )
    assert_not faculty.save, "Saved a personal page link without including http or https"
  end 

  #test email in create faculty page, must be valid email e.g xxx@xxx.xxx.
  test "must be valid email" do
    faculty = Faculty.new( email: "exampleemail" )
    assert_not faculty.save, "Saved a invalid email with wrong format"
  end 




end
