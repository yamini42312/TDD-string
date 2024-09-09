module StringCalculator
	def add
		return 0 if empty?
		digits.inject {|sum, x| sum + x}
	end

	def digits
		gsub("\n", delimiter).split(delimiter).map {|x| x.to_i}
	end

	def delimiter
		@delimiter ||= self[0,2] == "//" ? delimiter = self[2,1] : ','
	end
end