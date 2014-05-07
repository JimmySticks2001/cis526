require 'test_helper'

class ResearchTest < ActiveSupport::TestCase

	#test title in research page, minimum character requirement.
  	test "Title should have a minimum of 3 characters" do
  		research = Research.new( title: ":D")
  		assert_not research.save, "Saved a research article with less than 3 characters in the title."
 	end


 	#test title in research page, maximum character requirement.
  	test "Title should have a maximum of 140 characters" do
  		long_string = ""
     
     	139.times do
       		long_string += "a"
     	end

     	assert long_string.length == 139, "Test string was not 139 characters long"
 
     	research = Research.new( title: long_string )
     	assert research.save, "Unable to save a 139 character long post"
 
    	research = Research.new( title: long_string + "a" )
     	assert_not research.save, "Saved a research title 140 characters long"
 	end


 	#test title in research page, not all whitespace requirement.
   	test "Title should not have all whitespace" do
     	white_string = ""
 
     	20.times do
       		white_string += " "
     	end

     	assert white_string.length == 20, "Test string was not 20 characters long"
 
     	research = Research.new( title: white_string )
     	assert_not club.save, "Saved a title with all whitespace"
   	end


   	#test title in research page, not all numbers requirement.
   	test "Title should contain alpha characters" do
     	number_string = ""
 
     	20.times do
       		number_string += "4"
     	end

     	assert number_string.length == 20, "Test string was not 20 characters long"
 
     	research = Research.new( title: number_string )
     	assert_not club.save, "Saved a title with all numbers"
   	end


   	#test content in research page, minimum character requirement.
  	test "Content should have a minimum of 3 characters" do
  		research = Research.new( title: ":D")
  		assert_not research.save, "Saved a research article with less than 3 characters in the content."
 	end


 	#test content in research page, maximum character requirement.
  	test "Content should have a maximum of 1500 characters" do
  		long_string = ""
     
     	1499.times do
       		long_string += "a"
     	end

     	assert long_string.length == 1499, "Test string was not 1499 characters long"
 
     	research = Research.new( title: long_string )
     	assert research.save, "Unable to save a 1499 character long post"
 
    	research = Research.new( title: long_string + "a" )
     	assert_not research.save, "Saved a research title 1500 characters long"
 	end


 	#test content in research page, not all whitespace requirement.
   	test "Content should not have all whitespace" do
     	white_string = ""
 
     	20.times do
       		white_string += " "
     	end

     	assert white_string.length == 20, "Test string was not 20 characters long"
 
     	research = Research.new( title: white_string )
     	assert_not club.save, "Saved content with all whitespace"
   	end


   	#test content in research page, not all numbers requirement.
   	test "Content should contain alpha characters" do
     	number_string = ""
 
     	20.times do
       		number_string += "4"
     	end

     	assert number_string.length == 20, "Test string was not 20 characters long"
 
     	research = Research.new( title: number_string )
     	assert_not club.save, "Saved content with all numbers"
   	end

end