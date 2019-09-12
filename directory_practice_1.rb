@students = [] #empty array accessible to all methods

def add_to_student_array(name)
  @students << {name: name, cohort: :november}
end

def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  # get the first name
  name = STDIN.gets.chomp
  puts 'Thanks'
  # while the name is not empty, repeat this code
  while !name.empty? do
    #add the student hash to the array
    add_to_student_array(name)
    puts "Now we have #{@students.count} students"
    # get another name from the user
    name = STDIN.gets.chomp
    puts 'Thanks again'
  end
end

def interactive_menu
  loop do
    print_menu
    menu_input(STDIN.gets.chomp)
  end
end

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to students.csv"
  puts "4. Load the list from students.csv"
  puts "9. Exit"
end

def show_students
  print_header
  print_student_list
  print_footer
end

def menu_input(input)
    case input
    when "1"
      input_students
    when "2"
      show_students
    when "3"
      save_students
    when "4"
      load_students
    when "9"
      exit #terminate program
    else
      puts "I don't know what you meant, try again"
    end
end

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print_student_list
  @students.each do |student|
    puts "#{student[:name]} (#{student[:cohort]} cohort)"
  end
end

def print_footer
puts "Overall, we have #{@students.count} great students"
end

def save_students
  # open the file for writing
  file = File.open("students.csv", "w")
  #iterate over the student array
  @students.each do |student|
    student_data = [student[:name], student[:cohort]]
    csv_line = student_data.join(',')
    file.puts csv_line
  end
  file.close
  puts 'Saved!'
end

def load_students(filename = "students.csv")
  file = File.open(filename, "r")
  file.readlines.each do |line|
  name, cohort = line.chomp.split(',')
    add_to_student_array(name)
  end
  file.close
end

def try_load_students
  filename =ARGV.first || "students.csv" #first command line argument
  return if filename.nil? # leave method if filename not given
  if File.exists?(filename) # if the file does exist
    load_students(filename)
      puts "Loaded #{@students.count} from #{filename}"
  else # if filename doesn't exist
    puts "Sorry, #{filename} doesn't exist"
  end
end

try_load_students
interactive_menu