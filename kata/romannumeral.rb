module Kata

	class RomanNumeral

		@@numerals = [
			'I', # 10^0
			'X', # 10^1
			'C', # 10^2
			'M'  # 10^3
		]
		@@fives = [
			'V', # 5*10^0
			'L', # 5*10^1
			'D'  # 5*10^2
		]

		def initialize(n)
			@n = n
			@numeral = ''

			digits = split_into_digits(@n)

			digits.each.with_index do | digit, index |
				pos = digits.length - index - 1

				if digit == 9
					@numeral += @@numerals[pos] + @@numerals[pos + 1]
				elsif digit == 4
					@numeral += @@numerals[pos] + @@fives[pos]
				elsif digit >= 5 && pos < @@fives.length
					@numeral += @@fives[pos] + @@numerals[pos] * (digit - 5)
				else
					@numeral += @@numerals[pos] * digit
				end
			end
		end

		def split_into_digits(number)
			number.to_s.chars.map { | s | s.to_i }
		end

		def to_s
			@numeral
		end
	end

end