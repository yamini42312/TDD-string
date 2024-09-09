module StringCalculator
	def add
		return 0 if empty?
		return to_i unless include?(',')
		digits = split(',').map {|x| x.to_i}
		digits[0] + digits[1]
	end
end