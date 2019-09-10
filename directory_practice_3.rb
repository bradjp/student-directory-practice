def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  # create an empty array
  students = []
  # get the first name, alternative to chomp
  name = gets.slice(0...-1)
  # while the name is not empty, repeat this code
  while !name.empty? do
    #make cohort selectable (or default to current month)
    puts 'Cohort? (If left empty current month will be assumed)'
    cohort = gets.chomp
    #add month array so cohort can be defaulted
    month = ["January", "February", "March", "April", "May", "June", "July", "August",
    "September", "October", "November", "December"]
    #add the student hash to the array only if it begins with 'A' / < 12 letters
    if name[0] == 'A' && name.length < 12 && !cohort.empty? && month.include?(cohort.capitalize)
    students << { name: name.downcase.capitalize, cohort: cohort.capitalize }
    elsif name[0] == 'A' && name.length < 12 && !cohort.empty? && !month.include?(cohort.capitalize)
    puts 'Cohort invalid. Try again'
    else
    students << { name: name.downcase.capitalize, cohort: month[Time.now.month - 1] }
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
    puts "#{sum+1}. #{students[sum][:name]} (#{students[sum][:cohort]} cohort)"
    sum += 1
  end
end

def print_footer(names)
puts "Overall, we have #{names.count} great students"
end

def print_by_cohort(students)
  puts 'Which cohort?'
  cohort = gets.chomp.capitalize
  chosen_cohort = students.select { |x| x[:cohort] == cohort }
  if !cohort.empty?
    puts cohort + ' cohort:'
    chosen_cohort.each { |student| puts student[:name] }
  else
    puts 'No cohort selected.'
  end
end

students = input_students
#nothing happens until we call the methods
print_header
print(students)
print_footer(students)
print_by_cohort(students)
