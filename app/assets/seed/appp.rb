File.foreach('seed.html').with_index do |line, line_num|
	if line_num > 92 && line_num < 95
   puts "#{line_num}: #{line}"
	end
end


