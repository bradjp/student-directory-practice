def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  # create an empty array
  students = []
  # get the first name
  name = gets.chomp
  # while the name is not empty, repeat this code
  while !name.empty? do
    puts "Please enter the data as requested, or N/A to move on"
    puts 'Hobbies? (separate with a comma)'
    hobbies = gets.chomp
    puts 'In which country were you born?'
    cob = gets.chomp
    puts 'How tall are you (cm)?'
    height = gets.chomp
    #add the student hash to the array only if it begins with 'A' / < 12 letters
    if name[0] == 'A' && name.length < 12
    students << { name: name, cohort: :november, cob: cob, hobbies: hobbies, height: height }
    puts "Now we have #{students.count} students"
    end
    # get another name from the user
    puts 'Another student? Or hit return to continue'
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
  #using loop instead of iterator
  sum = 0
  while sum < students.length
    puts "#{sum+1}. #{students[sum][:name]} (#{students[sum][:cohort]} cohort)
    #{students[sum][:name]} is from #{students[sum][:cob]}, and #{students[sum][:height]}cm tall. Hobbies: #{students[sum][:hobbies]}"
    sum += 1
  end
end

def print_footer(names)
puts "Overall, we have #{names.count} great students"
end

students = input_students
#nothing happens until we call the methods
print_header()
print(students)
print_footer(students)
