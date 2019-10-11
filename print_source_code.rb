def print_source_code
  file = File.open($0, "r") do |file|
    file.readlines.each do |line|
      puts line
    end
  end
end

print_source_code
puts File.basename(__FILE__)
