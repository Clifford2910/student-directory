def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  students = []
  default_cohort = "january"
  #get the name and cohort
  name = gets.chomp
  puts "Please enter the month of the cohort.  If you enter a blank, then we will use the default value of #{default_cohort}"
  cohort = gets.chomp
  #while the name is not empty, repeat this code
  while !name.empty? do
    if cohort.empty?
      cohort = default_cohort
    end
    #add the student hash to the array
    students << {name: name, cohort: cohort}
    if students.count == 1
      puts "Now we have 1 student"
    else
      puts "Now we have #{students.count} students"
    end
    #get another name and cohort from the user
    puts "Please enter the names of the students"
    name = gets.chomp
    if !name.empty?
      puts "Please enter the month of the cohort.  If you enter a blank, then we will use the default value of #{default_cohort}"
    end
    cohort = gets.chomp
  end
  students
end

def print_header
  puts "The students of Villains Academy"
  puts "---------------"
end

def print(students)
  students.each do |student|
    puts "#{student[:name]} (#{student[:cohort]} cohort)"
  end
end

def print_footer(students)
  if students.count < 1
    puts "Currently we don't have anyone at the Academy"
  elsif students.count == 1
    puts "Overall we have 1 great student"
  else
    puts "Overall, we have #{students.count} great students"
  end
end

students = input_students
#nothing happens until we call the methods
print_header
print(students) if students.count >= 1
print_footer(students)
