module MorphemesHelper
	def translateCodes(input)
		inputSplit = (input.split("+").size > 1 ? input.split("+") : input.split("/"))
		result = ""
		inputSplit.each_with_index do |ipt, index|
			result += (Morpheme::CODES[inputSplit[index]] ? Morpheme::CODES[inputSplit[index]] : inputSplit[index]) + (index != (inputSplit.size - 1) ? " + " : "")
		end
		return result
	end
end
