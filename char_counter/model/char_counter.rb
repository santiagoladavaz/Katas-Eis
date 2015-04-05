class CharCounter

	def self.count(string)
		dic = Hash.new
        if string == nil
            return dic
        end
        string = string.delete(" ")
	    string.each_char{|c| dic[c] = string.count(c)}	
        
        dic
	end

end