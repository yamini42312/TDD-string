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

end