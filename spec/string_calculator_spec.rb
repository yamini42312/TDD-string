require './string_calculator.rb'

RSpec::Matchers.define :add_to do |expected|
	match do |string|
		(@result = string.extend(StringCalculator).add) == expected
	end

	 failure_message do |string|
	 	"Expected #{string} to add up to #{expected}, but got #{@result}"
	 end
end

RSpec.describe "String calculator" do

	#Task-1 : String calculator with a add method which take inputs "", "1", "1,5" and returns output 0,1,6
	it "returns 0 for empty string" do
		"".should add_to(0)
	end

	context "single number" do
		it "returns 1 for 1" do
			"1".should add_to(1)
		end

	end

	context "2 numbers" do
		it "reutrns 6 for 1,5" do
			"1,5".should add_to(6)
		end
	end

	#Task-2 : Allow the add method to handle any amount of numbers.
	context "n numbers" do
		it "returns 100 for 20,30,40,10" do
			"20,30,40,10".should add_to(100)
		end

		it "returns 100 for 15,5,30,40,10" do
			"15,5,30,40,10".should add_to(100)
		end
	end

	#Task-3 : Allow the add method to handle new lines between numbers (instead of commas). ("1\n2,3" should return 6)
	context "new lines between numbers" do
		it "support new line" do 
			"1\n2,3".should add_to(6)
		end
	end

	#Task-4 : Support different delimiters
	context "support different delimiters" do
		it "different delimiters" do 
			"//;\n1;2".should add_to(3)
		end
	end
	

end