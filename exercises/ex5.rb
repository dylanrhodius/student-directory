def input_students
  puts "Please enter the name, surname, country of birth, and age of each student, with each detail separated by a comma."
  puts "Example: Dylan, Rhodius, Canada, 23"
  puts "To finish, just hit return twice."
  # create an empty array
  students = []
  # get the student's info
  student_details = gets.chomp
  # while the student info is not empty, repeat this code
  while !student_details.empty? do
    # create student info array to then individually add to students array
    student_info_array = student_details.split(", ")
    # add the student hash to the student array
    students << {name: student_info_array[0], surname: student_info_array[1], country: student_info_array[2], age: student_info_array[3], cohort: :november}
    puts "Now we have #{students.count} students"
    # get another student from the user
    student_details = gets.chomp
  end
  # return the array of students
  students
end

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print(students)
  students.each_with_index do |student, index|
    puts "#{index.to_i + 1}. Name: #{student[:name]} #{student[:surname]}. Country of birth: #{student[:country]}. Age: #{student[:age]}. Cohort: #{student[:cohort]}"
  end
end

def print_footer(students)
  puts "Overall, we have #{students.count} great students"
end

students = input_students
# nothing happens until we call the methods
print_header
print(students)
print_footer(students)
