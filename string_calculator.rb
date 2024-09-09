module StringCalculator
	def add
		return 0 if empty?
		digits.inject {|sum, x| sum + x}
	end

	def digits
		gsub("\n", ',').split(',').map {|x| x.to_i}
	end
end