@students = [] #an empty array accessible to all methods
@width = 70

def print_menu
  puts "1. Input the students".center(@width)
  puts "2. Show the students".center(@width)
  puts "3. Save the list to students.csv".center(@width)
  puts "4. Load the list from students.csv".center(@width)
  puts "9. Exit".center(@width) #9 because we'll be adding more items
end

def interactive_menu
  loop do
    print_menu
    process(STDIN.gets.chomp)
  end
end

def process(selection)
  case selection
  when "1"
    input_students
  when "2"
    show_students
  when "3"
    save_students
  when "4"
    load_students
  when "9"
    puts "*** Goodbye ***".center(@width)
    exit #this will cause the program to terminate
  else
    puts "I don't know what you meant, try again".center(@width)
  end
end

def input_students
  puts "Please enter the names of the students".center(@width)
  puts "To finish, just hit return twice".center(@width)
  #get the first name
  name = STDIN.gets.chomp
  #while the name is not empty, repeat this code
  while !name.empty? do
    #add the student hash to the array
    add_student(name)
    if @students.count == 1
      puts "Now we have #{@students.count} student".center(@width)
    else
      puts "Now we have #{@students.count} students".center(@width)
    end
    #get another name from the user
    name = STDIN.gets.chomp
  end
end

def add_student(name)
  @students << {name: name, cohort: :november}
end

def show_students
  print_header
  print_student_list
  print_footer
end

def print_header
  puts "The students of Villains Academy".center(@width)
  puts "---------------".center(@width)
end

def print_student_list
  @students.each.with_index(1) do |student, index|
    puts "#{index}. #{student[:name]} (#{student[:cohort]} cohort)".center(@width)
  end
end

def print_footer
  if @students.count == 0
    puts "We currently have 0 students".center(@width)
  elsif @students.count == 1
    puts "We have 1 great student".center(@width)
  else
    puts "Overall, we have #{@students.count} great students".center(@width)
  end
end

def save_students
  puts "Please enter the filename (eg. example.csv)".center(@width)
  filename = gets.chomp
  #open the file for writing
  file = File.open(filename, "w") do |file|
    #iterate over the array of students
    @students.each do |student|
      student_data = [student[:name], student[:cohort]]
      csv_line = student_data.join(",")
      file.puts csv_line
    end
    puts "*** Saved successfully to: #{filename} ***".center(@width)
  end
end

def load_students
  puts "Please enter the name of the file to load (eg. ecample.csv)".center(@width)
  load_filename = gets.chomp
  file = File.open(load_filename, "r") do |file|
    file.readlines.each do |line|
      name, cohort = line.chomp.split(",")
      add_student(name)
    end
    puts "*** File: #{load_filename} loaded successfully ***".center(@width)
  end
end

def try_load_students
  filename = ARGV.first #first argument from the command line
  return if filename.nil? #get out of the method if it isn't given
  if File.exists?(filename) #if it exists
    load_students(filename)
    puts "Loaded #{@students.count} from #{filename}".center(@width)
  else #if it doesn't exist
    puts "Sorry, #{filename} doesn't exist".center(@width)
    exit #quit the program
  end
end

try_load_students
interactive_menu
