def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  # create an empty array
  students = []
  # get the first name
  name = gets.chomp
  # while the name is not empty, repeat this code
  while !name.empty? do
    #add the student hash to the array only if it begins with 'A' / < 12 letters
    if name[0] == 'A' && name.length < 12
    students << { name: name, cohort: :november }
    puts "Now we have #{students.count} students"
    end
    # get another name from the user
    name = gets.chomp
  end
# return the array of students
students
end

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print(students)
  # add index before each student
  students.each_with_index do |student, index|
    puts "#{index + 1}. #{student[:name]} (#{student[:cohort]} cohort)"
  end
end

def print_footer(names)
puts "Overall, we have #{names.count} great students"
end

students = input_students
#nothing happens until we call the methods
print_header
print(students)
print_footer(students)